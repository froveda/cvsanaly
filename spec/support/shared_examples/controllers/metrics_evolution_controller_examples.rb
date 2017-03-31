shared_examples_for 'metrics_evolution data initialization' do
  before(:each) do
    beginning_of_month = Date.today.beginning_of_month
    end_of_month = Date.today.end_of_month

    @repository_a = create(:repository, name: 'A')
    @branch_a_repository_a = create(:branch)
    @branch_b_repository_a = create(:branch)
    @file_a = create(:file_scm, repository: @repository_a)
    @commit_a_lowest_date = create(:commit, repository: @repository_a, date: beginning_of_month)
    @commit_a_highest_date = create(:commit, repository: @repository_a, date: end_of_month)
    @action_a_repository_a = create(:action, branch: @branch_a_repository_a, file_scm: @file_a, commit: @commit_a_highest_date)
    @action_b_repository_a = create(:action, branch: @branch_b_repository_a, file_scm: @file_a, commit: @commit_a_highest_date)
    @metric_a_repository_a = create(:metrics_evo, sloc: 110, loc: 200, branch: @branch_a_repository_a, files: 10, date: beginning_of_month)
    @metric_b_repository_a = create(:metrics_evo, sloc: 110, loc: 200, branch: @branch_a_repository_a, files: 10, date: beginning_of_month)
    @metric_c_repository_a = create(:metrics_evo, sloc: 90, loc: 300, branch: @branch_a_repository_a, files: 10, date: beginning_of_month)
    @metric_d_repository_a = create(:metrics_evo, sloc: 200, loc: 100, branch: @branch_b_repository_a, files: 10, date: beginning_of_month)

    @repository_b = create(:repository, name: 'B')
    @branch_b = create(:branch)
    @file_b = create(:file_scm, repository: @repository_b)
    @commit_b_lowest_date = create(:commit, repository: @repository_b, date: Date.today - 2.month)
    @commit_b_highest_date = create(:commit, repository: @repository_b, date: Date.today + 1.month)
    @action_b = create(:action, branch: @branch_b, file_scm: @file_b, commit: @commit_b_highest_date)
    @metric_a_repository_b = create(:metrics_evo, sloc: 110, loc: 200, branch: @branch_b, files: 10, date: beginning_of_month)
    @metric_b_repository_b = create(:metrics_evo, sloc: 90, loc: 300, branch: @branch_b, files: 10, date: beginning_of_month)
  end
end

shared_examples_for 'access to :metrics_evolution with user logged in' do
  include_examples 'metrics_evolution data initialization'

  context 'Get #metrics_evolution' do
    it 'populates an array of repositories' do
      get :metrics_evolution
      expect(assigns(:repositories)).to match_array([@repository_a, @repository_b])
    end

    it 'populates an array of branches of the repository of lowest id' do
      get :metrics_evolution
      expect(assigns(:branches)).to match_array([@branch_a_repository_a, @branch_b_repository_a])
    end

    it 'populates an array of metrics types' do
      get :metrics_evolution
      expect(assigns(:metrics_types)).to match_array(['All', 'LOC', 'SLOC', 'Files'])
    end

    it 'set from and to variables as the edge existing commit dates of the repository of lowest id' do
      get :metrics_evolution
      expect(assigns(:from)).to eq(@commit_a_lowest_date.date.beginning_of_month)
      expect(assigns(:to)).to eq(@commit_a_highest_date.date.end_of_month)
    end
  end
end

shared_examples_for 'access to :metrics_evolution_filtered with user logged in' do
  include_examples 'metrics_evolution data initialization'

  context 'with no parameters' do
    it 'renders the :metrics_evolution_filtered template' do
      get :metrics_evolution_filtered
      expect(response).to render_template(text: "No results were found.")
    end
  end

  describe 'Get #metrics_evolution_filtered' do
    describe 'filtering by' do
      context 'repository_a' do
        before(:each) do
          @params = {
            filter: {
              repository: @repository_a,
              :'from(1i)' => @commit_a_lowest_date.date.year,
              :'from(2i)' => @commit_a_lowest_date.date.month,
              :'to(1i)' => @commit_a_highest_date.date.year,
              :'to(2i)' => @commit_a_highest_date.date.month
            }
          }
        end

        context 'without branch or type param' do
          it 'populates an array of commits for the repository_a' do
            get :metrics_evolution_filtered, @params

            metrics_evo = assigns(:metrics_evo).all
            metrics_evo = metrics_evo.collect {|metric| [metric.branch_id, metric.date, metric.loc, metric.sloc, metric.files]}

            total_loc = [@metric_a_repository_a, @metric_b_repository_a, @metric_c_repository_a].inject(0){|sum, metric| sum + metric.loc}
            total_sloc = [@metric_a_repository_a, @metric_b_repository_a, @metric_c_repository_a].inject(0){|sum, metric| sum + metric.sloc}
            total_files = [@metric_a_repository_a, @metric_b_repository_a, @metric_c_repository_a].inject(0){|sum, metric| sum + metric.files}
            expected_metrics_evo = [
              [@branch_a_repository_a.id, @metric_a_repository_a.date, total_loc, total_sloc, total_files],
              [@branch_b_repository_a.id, @metric_d_repository_a.date, @metric_d_repository_a.loc, @metric_d_repository_a.sloc, @metric_d_repository_a.files]
            ]

            expect(metrics_evo).to match_array(expected_metrics_evo)
          end

          it 'renders the :metrics_evolution_filtered template' do
            get :metrics_evolution_filtered, @params
            expect(response).to render_template :metrics_evolution_filtered
          end
        end

        context 'with branch param' do
          before(:each) do
            @params[:filter][:branch] = @branch_b_repository_a
          end

          it 'populates an array of commits for the repository_a and branch_b_repository_a' do
            get :metrics_evolution_filtered, @params

            metrics_evo = assigns(:metrics_evo).all
            metrics_evo = metrics_evo.collect {|metric| [metric.branch_id, metric.date, metric.loc, metric.sloc, metric.files]}
            expected_metrics_evo = [
              [@branch_b_repository_a.id, @metric_d_repository_a.date, @metric_d_repository_a.loc, @metric_d_repository_a.sloc, @metric_d_repository_a.files]
            ]

            expect(metrics_evo).to match_array(expected_metrics_evo)
          end

          it 'renders the :metrics_evolution_filtered template' do
            get :metrics_evolution_filtered, @params
            expect(response).to render_template :metrics_evolution_filtered
          end
        end
      end
    end
  end
end