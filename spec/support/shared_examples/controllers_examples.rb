shared_examples_for 'redirect to login path when no user is logged in' do |trying_to_access_path|
  context 'with no user logged in' do
    it 'does not have a current_user' do
      expect(subject.current_user).to eq(nil)
    end

    it 'Redirects to login path' do
      get trying_to_access_path
      expect(response).to redirect_to new_user_session_path
    end
  end
end

## HomeController
shared_examples_for 'access to :home with user logged in' do
  it 'has a current_user' do
    expect(subject.current_user).to_not eq(nil)
  end

  it 'renders the :home template' do
    get :home
    expect(response).to render_template :home
  end
end

## BadSmellByNfunctionsController
shared_examples_for 'access to :bad_smell_by_nfunctions with user logged in' do
  it 'populates an array of repositories' do
    repository1 = create(:repository)
    repository2 = create(:repository)

    get :bad_smell_by_nfunctions
    expect(assigns(:repositories)).to match_array([repository1, repository2])
  end

  it 'renders :bad_smell_by_nfunctions' do
    get :bad_smell_by_nfunctions
    expect(response).to render_template :bad_smell_by_nfunctions
  end
end

shared_examples_for 'access to :bad_smell_by_nfunctions_filtered with user logged in' do
  before(:each) do
    @metric_nfunctions_12 = create(:metric, nfunctions: 12, lang: 'java')
    @metric_nfunctions_8 = create(:metric, nfunctions: 8, lang: 'java')
    @file_nfunctions_12 = create(:file_scm, metrics: [@metric_nfunctions_12])
    @file_nfunctions_8 = create(:file_scm, metrics: [@metric_nfunctions_8])
    @repository = create(:repository, files: [@file_nfunctions_12, @file_nfunctions_8])
  end

  context 'with a limit of 12 (limit higher than the existing nfunction value in the database)' do
    it 'populates an array of metrics with no metrics' do
      get :bad_smell_by_nfunctions_filtered, filter: { limit: 12, repository: @repository }
      expect(assigns(:metrics)).to match_array([])
    end

    it "renders the :bad_smell_by_nfunctions_filtered template" do
      get :bad_smell_by_nfunctions_filtered, filter: { limit: 12, repository: @repository }
      expect(response).to render_template :bad_smell_by_nfunctions_filtered
    end
  end

  context 'with a limit of 10' do
    it 'populates an array of metrics with metrics with nfunction higher than 10' do
      get :bad_smell_by_nfunctions_filtered, filter: { limit: 10, repository: @repository }
      expect(assigns(:metrics)).to match_array([@metric_nfunctions_12])
    end

    it "renders the :bad_smell_by_nfunctions_filtered template" do
      get :bad_smell_by_nfunctions_filtered, filter: { limit: 10, repository: @repository }
      expect(response).to render_template :bad_smell_by_nfunctions_filtered
    end
  end

  context 'with a limit of 8' do
    it 'populates an array of metrics with metrics with nfunction higher than 8' do
      get :bad_smell_by_nfunctions_filtered, filter: { limit: 8, repository: @repository }
      expect(assigns(:metrics)).to match_array([@metric_nfunctions_12])
    end

    it "renders the :bad_smell_by_nfunctions_filtered template" do
      get :bad_smell_by_nfunctions_filtered, filter: { limit: 8, repository: @repository }
      expect(response).to render_template :bad_smell_by_nfunctions_filtered
    end
  end

  context 'with a limit of 7 (limit lower than the lowest nfunction value in the database)' do
    it 'populates an array of metrics with metrics with nfunction higher than 8' do
      get :bad_smell_by_nfunctions_filtered, filter: { limit: 7, repository: @repository }
      expect(assigns(:metrics)).to match_array([@metric_nfunctions_12, @metric_nfunctions_8])
    end

    it "renders the :bad_smell_by_nfunctions_filtered template" do
      get :bad_smell_by_nfunctions_filtered, filter: { limit: 7, repository: @repository }
      expect(response).to render_template :bad_smell_by_nfunctions_filtered
    end
  end
end

## BadSmellByNfunctionsController
shared_examples_for 'access to :bad_smell_by_sloc with user logged in' do
  it 'populates an array of repositories' do
    repository1 = create(:repository)
    repository2 = create(:repository)

    get :bad_smell_by_sloc
    expect(assigns(:repositories)).to match_array([repository1, repository2])
  end

  it 'renders :bad_smell_by_sloc' do
    get :bad_smell_by_sloc
    expect(response).to render_template :bad_smell_by_sloc
  end
end

shared_examples_for 'access to :bad_smell_by_sloc_filtered with user logged in' do
  before(:each) do
    @metric_sloc_110 = create(:metric, sloc: 110, lang: 'java')
    @metric_sloc_90 = create(:metric, sloc: 90, lang: 'java')
    @file_sloc_110 = create(:file_scm, metrics: [@metric_sloc_110])
    @file_sloc_90 = create(:file_scm, metrics: [@metric_sloc_90])
    @repository = create(:repository, files: [@file_sloc_110, @file_sloc_90])
  end

  context 'with a limit of 110 (limit higher than the existing sloc value in the database)' do
    it 'populates an array of metrics with no metrics' do
      get :bad_smell_by_sloc_filtered, filter: { limit: 110, repository: @repository }
      expect(assigns(:metrics)).to match_array([])
    end

    it "renders the :bad_smell_by_sloc_filtered template" do
      get :bad_smell_by_sloc_filtered, filter: { limit: 110, repository: @repository }
      expect(response).to render_template text: "No results were found."
    end
  end

  context 'with a limit of 100' do
    it 'populates an array of metrics with metrics with sloc higher than 100' do
      get :bad_smell_by_sloc_filtered, filter: { limit: 100, repository: @repository }
      expect(assigns(:metrics)).to match_array([@metric_sloc_110])
    end

    it "renders the :bad_smell_by_sloc_filtered template" do
      get :bad_smell_by_sloc_filtered, filter: { limit: 100, repository: @repository }
      expect(response).to render_template :bad_smell_by_sloc_filtered
    end
  end

  context 'with a limit of 90' do
    it 'populates an array of metrics with metrics with sloc higher than 90' do
      get :bad_smell_by_sloc_filtered, filter: { limit: 90, repository: @repository }
      expect(assigns(:metrics)).to match_array([@metric_sloc_110])
    end

    it "renders the :bad_smell_by_sloc_filtered template" do
      get :bad_smell_by_sloc_filtered, filter: { limit: 90, repository: @repository }
      expect(response).to render_template :bad_smell_by_sloc_filtered
    end
  end

  context 'with a limit of 80 (limit lower than the lowest sloc value in the database)' do
    it 'populates an array of metrics with metrics with sloc higher than 80' do
      get :bad_smell_by_sloc_filtered, filter: { limit: 80, repository: @repository }
      expect(assigns(:metrics)).to match_array([@metric_sloc_110, @metric_sloc_90])
    end

    it "renders the :bad_smell_by_sloc_filtered template" do
      get :bad_smell_by_sloc_filtered, filter: { limit: 80, repository: @repository }
      expect(response).to render_template :bad_smell_by_sloc_filtered
    end
  end
end