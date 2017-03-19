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
    set_modifications_amount_by_commit_chart

    if @commits_hash.any?
      render :layout => false
    else
      render :text => "No results were found."
    end
  end

  private
  def set_commits_by_date
    @commits_hash = Hash.new()
    @commits.each do |commit|
      @commits_hash[commit.date.strftime("%Y-%m-%d")] = Hash.new() unless @commits_hash[commit.date.strftime("%Y-%m-%d")]
      @commits_hash[commit.date.strftime("%Y-%m-%d")][commit.type] = commit.sum
    end
  end

  def set_modifications_amount_by_commit_chart
    data_table = GoogleVisualr::DataTable.new

    # Add Column Headers
    data_table.new_column('string', 'Date' )
    data_table.new_column('number', 'Added')    if ['','A'].include?(modification)
    data_table.new_column('number', 'Modified') if ['','M'].include?(modification)
    data_table.new_column('number', 'Deleted')  if ['','D'].include?(modification)
    data_table.new_column('number', 'Renamed')  if ['','V'].include?(modification)
    data_table.new_column('number', 'Copied')   if ['','C'].include?(modification)
    data_table.new_column('number', 'Replaced') if ['','R'].include?(modification)

    rows = []
    @commits_hash.each_pair do |key, value|
      row = Array.new()
      row.push(key)
      row.push(value['A'].nil? ? 0 : value['A']) if ['','A'].include?(modification)
      row.push(value['M'].nil? ? 0 : value['M']) if ['','M'].include?(modification)
      row.push(value['D'].nil? ? 0 : value['D']) if ['','D'].include?(modification)
      row.push(value['V'].nil? ? 0 : value['V']) if ['','V'].include?(modification)
      row.push(value['C'].nil? ? 0 : value['C']) if ['','C'].include?(modification)
      row.push(value['R'].nil? ? 0 : value['R']) if ['','R'].include?(modification)
      rows.push(row)
    end

    # Add Rows and Values
    data_table.add_rows(rows)
    @chart = Chart.area_chart('SUM of Files Modified in time', 1024, 600, data_table)
  end
end