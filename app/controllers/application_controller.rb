class ApplicationController < ActionController::Base
  protect_from_forgery except: [:change_dates, :change_dates_for_metrics_evo, :change_branches, :change_commiters]

  before_filter :authenticate_user!
  before_filter :set_branches, only: [:change_branches]
  before_filter :set_dates, only: [:change_dates]
  before_filter :set_dates_metrics_evo, only: [:change_dates_for_metrics_evo]
  before_filter :set_committers, only: [:change_commiters]

  layout 'flatly'

  def change_dates
    render partial: 'shared/date_selectors', locals: { from: @from, to: @to }, layout: false
  end

  def change_dates_for_metrics_evo
    render partial: 'shared/date_selectors_month', locals: { from: @from, to: @to}, layout: false
  end

  def change_branches
    render partial: 'shared/branches_selector', locals: { branches: @branches }, layout: false
  end

  def change_commiters
    render partial: 'shared/committers_selector', locals: { committers: @committers }, layout: false
  end

  private
  def set_repositories
    @repositories = Repository.all
  end

  def set_dates
    @from = Commit.where(repository_id: repository).order("date asc").first.date rescue nil
    @to = Commit.where(repository_id: repository).order("date desc").first.date rescue nil
  end

  def set_dates_metrics_evo
    @from = MetricsEvo.where(branch_id: repository.branches.map(&:id)).order("date asc").first.date.beginning_of_month rescue nil
    @to = MetricsEvo.where(branch_id: repository.branches.map(&:id)).order("date desc").first.date.end_of_month rescue nil
  end

  def set_committers
    @committers = repository ? repository.committers : Person.all
  end

  def set_modifications
    @modifications = Action::TYPES
  end

  def set_branches
    @branches = branch ? [branch] : (repository.branches rescue [])
  end

  def set_metrics_types
    @metrics_types = ['All', 'LOC', 'SLOC', 'Files']
  end

  def repository
    return @repository if @repository

    # If we are filterin by repository, we get the one in the filter
    if(params[:filter] && params[:filter][:repository])
      return @repository = Repository.find(params[:filter][:repository]) rescue nil
    else
      # If we are not filtering, then it is the first of all repositories
      return @repository = @repositories.first
    end
  end

  def from(beginning_of_month = false)
    return nil unless params[:filter] && params[:filter]['from(1i)'] && params[:filter]['from(2i)']
    date_string = [params[:filter]['from(1i)'], params[:filter]['from(2i)'], params[:filter]['from(3i)'] ||= '01'].join('-')
    beginning_of_month ? Date.parse(date_string).beginning_of_month : Date.parse(date_string).beginning_of_day
  end

  def to(end_of_month = false)
    return nil unless params[:filter] && params[:filter]['to(1i)'] && params[:filter]['to(2i)']
    date_string = [params[:filter]['to(1i)'], params[:filter]['to(2i)'], params[:filter]['to(3i)'] ||= '01'].join('-')
    end_of_month ? Date.parse(date_string).end_of_month : Date.parse(date_string).end_of_day
  end

  def committer
    @committer ||= (Person.find(params[:filter][:committer]) rescue nil)
  end

  def modification
    @modification = params[:filter][:modification]
  end

  def branch
    @branch ||= (Branch.find(params[:filter][:branch]) rescue nil)
  end
end
