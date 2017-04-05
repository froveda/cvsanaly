class ModificationsAmountByCommitController < ApplicationController
  before_filter :set_repositories, :set_dates, :set_modifications, only: [:modifications_amount_by_commit]

  ## SUM of files modified in time
  def modifications_amount_by_commit
  end

  def modifications_amount_by_commit_filtered
    if from.nil? || to.nil? || repository.nil?
      render text: "No results were found."
      return
    end

    @commits = Commit.joins(:actions)
                 .select('DATE(scmlog.date) as date,
                          CONVERT( SUM(CASE WHEN actions.type = "A" THEN 1 ELSE 0 END), UNSIGNED INTEGER ) as sum_a,
                          CONVERT( SUM(CASE WHEN actions.type = "M" THEN 1 ELSE 0 END), UNSIGNED INTEGER ) as sum_m,
                          CONVERT( SUM(CASE WHEN actions.type = "D" THEN 1 ELSE 0 END), UNSIGNED INTEGER ) as sum_d,
                          CONVERT( SUM(CASE WHEN actions.type = "V" THEN 1 ELSE 0 END), UNSIGNED INTEGER ) as sum_v,
                          CONVERT( SUM(CASE WHEN actions.type = "C" THEN 1 ELSE 0 END), UNSIGNED INTEGER ) as sum_c,
                          CONVERT( SUM(CASE WHEN actions.type = "R" THEN 1 ELSE 0 END), UNSIGNED INTEGER ) as sum_r')
                 .where(scmlog: { date: (from .. to), repository_id: repository })
                 .group('DATE(scmlog.date)')
                 .order('DATE(scmlog.date) ASC')
    @commits = @commits.where(actions: { type: modification }) unless modification.blank?
    
    if @commits.any?
      render layout: false
    else
      render text: "No results were found."
    end
  end
end