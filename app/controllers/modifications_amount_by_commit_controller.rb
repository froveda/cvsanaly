class ModificationsAmountByCommitController < ApplicationController
  before_filter :set_repositories, only: [:modifications_amount_by_commit]
  before_filter :set_dates, only: [:modifications_amount_by_commit]
  before_filter :set_modifications, only: [:modifications_amount_by_commit]

  ## SUM of files modified in time
  def modifications_amount_by_commit
  end

  def modifications_amount_by_commit_filtered
    @commits = Commit.joins(:actions)
                 .select('scmlog.rev, scmlog.committer_id, DATE(scmlog.date) as date, COUNT(*) AS sum, actions.type')
                 .where(scmlog: { date: (from .. to), repository_id: repository })
                 .group('DATE(scmlog.date), type')
                 .order('DATE(scmlog.date) ASC')
    @commits = @commits.where(actions: { type: modification }) unless modification.blank?

    set_commits_by_date
    
    if @commits_hash.any?
      render layout: false
    else
      render text: "No results were found."
    end
  end

  private
  def set_commits_by_date
    @commits_hash = Hash.new()
    @commits.each do |commit|
      @commits_hash[commit.date] = Hash.new() unless @commits_hash[commit.date]
      @commits_hash[commit.date][commit.type] = commit.sum
    end
  end
end