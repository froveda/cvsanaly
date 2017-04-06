shared_examples_for 'bad_smell_by_nfunctions data initialization' do
  before(:each) do
    @repository = create(:repository)
    @commit_nfunctions_12 = create(:commit, repository: @repository)
    @commit_nfunctions_8 = create(:commit, repository: @repository)
    @file_nfunctions_12 = create(:file_scm, repository: @repository)
    @file_nfunctions_8 = create(:file_scm, repository: @repository)
    @metric_nfunctions_12 = create(:metric, nfunctions: 12, lang: 'java', file: @file_nfunctions_12, commit: @commit_nfunctions_12)
    @metric_nfunctions_8 = create(:metric, nfunctions: 8, lang: 'java', file: @file_nfunctions_8, commit: @commit_nfunctions_8)
  end
end

shared_examples_for 'access to :bad_smell_by_nfunctions with user logged in' do
  include_examples 'bad_smell_by_nfunctions data initialization'

  context 'Get #bad_smell_by_nfunctions' do
    it 'populates an array of repositories' do
      get :bad_smell_by_nfunctions
      expect(assigns(:repositories)).to match_array([@repository])
    end

    it 'renders :bad_smell_by_nfunctions' do
      get :bad_smell_by_nfunctions
      expect(response).to render_template :bad_smell_by_nfunctions
    end
  end
end

shared_examples_for 'access to :bad_smell_by_nfunctions_filtered with user logged in' do
  include_examples 'bad_smell_by_nfunctions data initialization'

  describe 'Get #bad_smell_by_nfunctions_filtered' do
    context 'with no parameters' do
      it 'renders the :bad_smell_by_nfunctions_filtered template' do
        get :bad_smell_by_nfunctions_filtered
        expect(response).to render_template(text: "No results were found.")
      end
    end

    describe 'with parameters' do
      context 'with a limit of 12 (limit higher than the existing nfunction value in the database)' do
        it 'populates an array of metrics with no metrics' do
          get :bad_smell_by_nfunctions_filtered, filter: { limit: 12, repository: @repository }
          expect(assigns(:metrics)).to match_array([])
        end

        it "renders the :bad_smell_by_nfunctions_filtered template" do
          get :bad_smell_by_nfunctions_filtered, filter: { limit: 12, repository: @repository }
          expect(response).to render_template text: "No results were found."
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
  end
end