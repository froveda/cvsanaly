shared_examples_for 'bad_smell_by_sloc data initialization' do
  before(:each) do
    @repository = create(:repository)
    @commit_nfunctions_110 = create(:commit, repository: @repository)
    @commit_nfunctions_90 = create(:commit, repository: @repository)
    @file_sloc_110 = create(:file_scm, repository: @repository)
    @file_sloc_90 = create(:file_scm, repository: @repository)
    @metric_sloc_110 = create(:metric, sloc: 110, lang: 'java', file: @file_sloc_110, commit: @commit_nfunctions_110)
    @metric_sloc_90 = create(:metric, sloc: 90, lang: 'java', file: @file_sloc_90, commit: @commit_nfunctions_90)
  end
end

shared_examples_for 'access to :bad_smell_by_sloc with user logged in' do
  include_examples 'bad_smell_by_sloc data initialization'

  context 'Get #bad_smell_by_sloc' do
    it 'populates an array of repositories' do
      get :bad_smell_by_sloc
      expect(assigns(:repositories)).to match_array([@repository])
    end

    it 'renders :bad_smell_by_sloc' do
      get :bad_smell_by_sloc
      expect(response).to render_template :bad_smell_by_sloc
    end
  end
end

shared_examples_for 'access to :bad_smell_by_sloc_filtered with user logged in' do
  include_examples 'bad_smell_by_sloc data initialization'

  describe 'Get #bad_smell_by_sloc_filtered' do
    context 'with no parameters' do
      it 'renders the :bad_smell_by_sloc_filtered template' do
        get :bad_smell_by_sloc_filtered
        expect(response).to render_template(text: "No results were found.")
      end
    end
  end

  describe 'with parameters' do
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
end