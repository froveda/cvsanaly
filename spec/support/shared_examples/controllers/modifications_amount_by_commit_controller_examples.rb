shared_examples_for 'modifications_amount_by_commit data initialization' do
  before(:each) do
    beginning_of_month = Date.today.beginning_of_month
    end_of_month = Date.today.end_of_month

    @modifications = Action::TYPES
    @repository_a = create(:repository, name: 'A')
    @commit_a_lowest_date = create(:commit, repository: @repository_a, date: beginning_of_month)
    @commit_a_highest_date = create(:commit, repository: @repository_a, date: end_of_month)
    @branch_a_repository_a = create(:branch)
    @branch_b_repository_a = create(:branch)
    @file_a = create(:file_scm, repository: @repository_a)
    @action_a_repository_a = create(:action, branch: @branch_a_repository_a, file_scm: @file_a, commit: @commit_a_lowest_date, type: 'A')
    @action_b_repository_a = create(:action, branch: @branch_b_repository_a, file_scm: @file_a, commit: @commit_a_highest_date, type: 'M')

    @repository_b = create(:repository, name: 'B')
    @commit_b_lowest_date = create(:commit, repository: @repository_b, date: Date.today - 2.month)
    @commit_b_highest_date = create(:commit, repository: @repository_b, date: Date.today + 1.month)
  end
end

shared_examples_for 'access to :modifications_amount_by_commit with user logged in' do
  include_examples 'modifications_amount_by_commit data initialization'

  context 'Get #modifications_amount_by_commit' do
    it 'populates an array of repositories' do
      get :modifications_amount_by_commit
      expect(assigns(:repositories)).to match_array([@repository_a, @repository_b])
    end

    it 'set from and to variables as the edge existing commit dates of the repository of lowest id' do
      get :modifications_amount_by_commit
      expect(assigns(:from)).to eq(@commit_a_lowest_date.date.beginning_of_month)
      expect(assigns(:to)).to eq(@commit_a_highest_date.date.end_of_month)
    end

    it 'populates an array of modifications types' do
      get :modifications_amount_by_commit
      expect(assigns(:branches)).to match_array([@branch_a_repository_a, @branch_b_repository_a])
    end
  end
end

shared_examples_for 'access to :modifications_amount_by_commit_filtered with user logged in' do
  include_examples 'modifications_amount_by_commit data initialization'

  describe 'Get #modifications_amount_by_commit_filtered' do
    context 'with no parameters' do
      it 'renders the :modifications_amount_by_commit_filtered template' do
        get :modifications_amount_by_commit_filtered
        expect(response).to render_template(text: "No results were found.")
      end
    end

    describe 'filtering by' do
      context 'repository_a' do
        before(:each) do
          @params = {
            filter: {
              repository: @repository_a,
              :'from(1i)' => @commit_a_lowest_date.date.year,
              :'from(2i)' => @commit_a_lowest_date.date.month,
              :'from(23i)' => @commit_a_lowest_date.date.day,
              :'to(1i)' => @commit_a_highest_date.date.year,
              :'to(2i)' => @commit_a_highest_date.date.month,
              :'to(3i)' => @commit_a_highest_date.date.day
            }
          }
        end

        context 'without modification type parameter' do
          it 'populates an array of commits for the repository_a with information of the amount of files modified' do
            get :modifications_amount_by_commit_filtered, @params

            commits = assigns(:commits).all
            commits = commits.collect {|commit|
              [commit.date, commit.sum_a, commit.sum_m, commit.sum_d, commit.sum_v, commit.sum_c, commit.sum_r]
            }
            expected_commits = [
              [Date.parse(@commit_a_lowest_date.date.strftime("%Y-%m-%d")), 1, 0, 0, 0, 0, 0],
              [Date.parse(@commit_a_highest_date.date.strftime("%Y-%m-%d")), 0, 1, 0, 0, 0, 0],
            ]

            expect(commits).to match_array(expected_commits)
          end

          it 'renders the :modifications_amount_by_commit_filtered template' do
            get :modifications_amount_by_commit_filtered, @params
            expect(response).to render_template :modifications_amount_by_commit_filtered
          end
        end

        context 'with modification type A parameter' do
          before(:each) do
            @params[:filter][:modification] = 'A'
          end

          it 'populates an array of commits for the repository_a with information of the amount of files modified for type A' do
            get :modifications_amount_by_commit_filtered, @params

            commits = assigns(:commits).all
            commits = commits.collect {|commit|
              [commit.date, commit.sum_a, commit.sum_m, commit.sum_d, commit.sum_v, commit.sum_c, commit.sum_r]
            }
            expected_commits = [
              [Date.parse(@commit_a_lowest_date.date.strftime("%Y-%m-%d")), 1, 0, 0, 0, 0, 0]
            ]

            expect(commits).to match_array(expected_commits)
          end

          it 'renders the :modifications_amount_by_commit_filtered template' do
            get :modifications_amount_by_commit_filtered, @params
            expect(response).to render_template :modifications_amount_by_commit_filtered
          end
        end

        context 'with a non supported modification type parameter' do
          it 'renders the :modifications_amount_by_commit_filtered template in text format' do
            @params[:filter][:modification] = 'Z'
            get :modifications_amount_by_commit_filtered, @params
            expect(response).to render_template(text: "No results were found.")
          end
        end
      end
    end
  end
end