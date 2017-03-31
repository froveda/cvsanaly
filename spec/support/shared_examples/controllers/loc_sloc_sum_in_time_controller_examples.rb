shared_examples_for 'loc_sloc_sum_in_time data initialization' do
  before(:each) do
    @john = create(:person, name: 'John')
    @lisa = create(:person, name: 'Lisa')
    @mark = create(:person, name: 'Mark')

    @repository_a = create(:repository, name: 'A')
    @commit_lowest_date = create(:commit, repository: @repository_a, date: Date.today - 1.month, committer: @john, author: @lisa)
    @commit_middle_date = create(:commit, repository: @repository_a, date: Date.today - 15.days, committer: @john, author: @mark)
    @commit_highest_date = create(:commit, repository: @repository_a, date: Date.today, committer: @lisa, author: @mark)
    @file_repository_a = create(:file_scm, repository: @repository_a)
    @metric_a_repository_a = create(:metric, sloc: 110, loc: 200, lang: 'java', commit: @commit_lowest_date, file: @file_repository_a)
    @metric_b_repository_a = create(:metric, sloc: 110, loc: 200, lang: 'java', commit: @commit_lowest_date, file: @file_repository_a)
    @metric_c_repository_a = create(:metric, sloc: 90, loc: 300, lang: 'java', commit: @commit_middle_date, file: @file_repository_a)
    @metric_d_repository_a = create(:metric, sloc: 200, loc: 100, lang: 'java', commit: @commit_highest_date, file: @file_repository_a)

    @repository_b = create(:repository, name: 'B')
    @commit_repository_b_lowest_date = create(:commit, repository: @repository_b, date: Date.today - 20.days, committer: @john, author: @lisa)
    @commit_repository_b_highest_date = create(:commit, repository: @repository_b, date: Date.today - 7.days, committer: @lisa, author: @mark)
    @file_repository_b = create(:file_scm, repository: @repository_b)
    @metric_a_repository_b = create(:metric, sloc: 110, loc: 200, lang: 'java', commit: @commit_repository_b_lowest_date, file: @file_repository_b)
    @metric_b_repository_b = create(:metric, sloc: 90, loc: 300, lang: 'java', commit: @commit_repository_b_highest_date, file: @file_repository_b)
  end
end


shared_examples_for 'access to :loc_sum_by_date with user logged in' do
  include_examples 'loc_sloc_sum_in_time data initialization'

  context 'Get #loc_sum_by_date' do
    it 'populates an array of repositories' do
      get :loc_sum_by_date
      expect(assigns(:repositories)).to match_array([@repository_a, @repository_b])
    end

    it 'populates an array of committers of the repository of lowest id' do
      get :loc_sum_by_date
      expect(assigns(:committers)).to match_array([@john, @lisa])
    end

    it 'set from and to variables as the edge existing commit dates of the repository of lowest id' do
      get :loc_sum_by_date
      expect(assigns(:from)).to eq(@commit_lowest_date.date)
      expect(assigns(:to)).to eq(@commit_highest_date.date)
    end
  end
end

shared_examples_for 'access to :loc_sum_by_date_filtered with user logged in' do
  include_examples 'loc_sloc_sum_in_time data initialization'

  describe 'Get #loc_sum_by_date_filtered' do

    context 'with no parameters' do
      it 'renders the :loc_sum_by_date_filtered template' do
        get :loc_sum_by_date_filtered
        expect(response).to render_template(text: "No results were found.")
      end
    end

    describe 'filtering by' do
      context 'repository_a' do
        before(:each) do
          @params = {
            filter: {
              repository: @repository_a,
              :'from(1i)' => @commit_lowest_date.date.year,
              :'from(2i)' => @commit_lowest_date.date.month,
              :'from(3i)' => @commit_lowest_date.date.day,
              :'to(1i)' => @commit_highest_date.date.year,
              :'to(2i)' => @commit_highest_date.date.month,
              :'to(3i)' => @commit_highest_date.date.day,
            }
          }
        end

        context 'without committer param' do
          it 'populates an array of commits for the repository_a' do
            get :loc_sum_by_date_filtered, @params

            commits = assigns(:commits)
            commits = commits.all.collect{|commit| [commit.date, commit.loc.to_i, commit.sloc.to_i]}
            expected_commits = [
              [@commit_lowest_date.date.to_date, @commit_lowest_date.metrics.sum(&:loc), @commit_lowest_date.metrics.sum(&:sloc)],
              [@commit_middle_date.date.to_date, @commit_middle_date.metrics.sum(&:loc), @commit_middle_date.metrics.sum(&:sloc)],
              [@commit_highest_date.date.to_date, @commit_highest_date.metrics.sum(&:loc), @commit_highest_date.metrics.sum(&:sloc)]
            ]

            expect(commits).to match_array(expected_commits)
          end

          it 'renders the :loc_sum_by_date_filtered template' do
            get :loc_sum_by_date_filtered, @params
            expect(response).to render_template :loc_sum_by_date_filtered
          end
        end

        context 'with committer param' do
          before(:each) do
            @params[:filter][:committer] = @john
          end

          it 'populates an array of commits for the repository_a' do
            get :loc_sum_by_date_filtered, @params

            commits = assigns(:commits)
            commits = commits.all.collect{|commit| [commit.date, commit.loc.to_i, commit.sloc.to_i]}
            expected_commits = [
              [@commit_lowest_date.date.to_date, @commit_lowest_date.metrics.sum(&:loc), @commit_lowest_date.metrics.sum(&:sloc)],
              [@commit_middle_date.date.to_date, @commit_middle_date.metrics.sum(&:loc), @commit_middle_date.metrics.sum(&:sloc)]
            ]

            expect(commits).to match_array(expected_commits)
          end

          it 'renders the :loc_sum_by_date_filtered template' do
            get :loc_sum_by_date_filtered, @params
            expect(response).to render_template :loc_sum_by_date_filtered
          end
        end
      end

      context 'repository_b' do
        before(:each) do
          @params = {
            filter: {
              repository: @repository_b,
              :'from(1i)' => @commit_repository_b_lowest_date.date.year,
              :'from(2i)' => @commit_repository_b_lowest_date.date.month,
              :'from(3i)' => @commit_repository_b_lowest_date.date.day,
              :'to(1i)' => @commit_repository_b_highest_date.date.year,
              :'to(2i)' => @commit_repository_b_highest_date.date.month,
              :'to(3i)' => @commit_repository_b_highest_date.date.day,
            }
          }
        end

        context 'without committer param' do
          it 'populates an array of commits for the repository_a' do
            get :loc_sum_by_date_filtered, @params

            commits = assigns(:commits)
            commits = commits.all.collect{|commit| [commit.date, commit.loc.to_i, commit.sloc.to_i]}
            expected_commits = [
              [@commit_repository_b_lowest_date.date.to_date, @commit_repository_b_lowest_date.metrics.sum(&:loc), @commit_repository_b_lowest_date.metrics.sum(&:sloc)],
              [@commit_repository_b_highest_date.date.to_date, @commit_repository_b_highest_date.metrics.sum(&:loc), @commit_repository_b_highest_date.metrics.sum(&:sloc)]
            ]

            expect(commits).to match_array(expected_commits)
          end

          it 'renders the :loc_sum_by_date_filtered template' do
            get :loc_sum_by_date_filtered, @params
            expect(response).to render_template :loc_sum_by_date_filtered
          end
        end

        context 'with committer param' do
          before(:each) do
            @params[:filter][:committer] = @john
          end

          it 'populates an array of commits for the repository_a' do
            get :loc_sum_by_date_filtered, @params

            commits = assigns(:commits)
            commits = commits.all.collect{|commit| [commit.date, commit.loc.to_i, commit.sloc.to_i]}
            expected_commits = [
              [@commit_repository_b_lowest_date.date.to_date, @commit_repository_b_lowest_date.metrics.sum(&:loc), @commit_repository_b_lowest_date.metrics.sum(&:sloc)]
            ]

            expect(commits).to match_array(expected_commits)
          end

          it 'renders the :loc_sum_by_date_filtered template' do
            get :loc_sum_by_date_filtered, @params
            expect(response).to render_template :loc_sum_by_date_filtered
          end
        end

      end

    end
  end
end