class LocSlocSumInTimeController < ApplicationController
  before_filter :set_repositories, only: [:loc_sum_by_date]
  before_filter :set_dates, only: [:loc_sum_by_date]
  before_filter :set_committers, only: [:loc_sum_by_date, :loc_sum_by_date_filtered]

  ## LOC/SLOC SUM in time
  def loc_sum_by_date
  end

  def loc_sum_by_date_filtered
    @commits = Commit.joins(:metrics)
                 .select('DATE(scmlog.date) as date, SUM(metrics.loc) AS loc, SUM(metrics.sloc) AS sloc')
                 .where(scmlog: { date: (from .. to), repository_id: repository })
                 .group('DATE(scmlog.date)')
                 .order('DATE(scmlog.date) asc')
    @commits = @commits.where(scmlog: { committer_id: committer }) unless committer.nil?

    set_loc_sum_by_date_chart

    if @commits.any?
      render :layout => false
    else
      render :text => "No results were found."
    end
  end

  private
  def set_loc_sum_by_date_chart
    # Add Column Headers
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Date' )
    data_table.new_column('number', 'LOC')
    data_table.new_column('number', 'SLOC')

    # Set the table data
    rows = @commits.collect{|commit| [commit.date.strftime("%Y-%m-%d"), commit.loc, commit.sloc] }

    # Add data and values to the table
    data_table.add_rows(rows)

    # Create an area chart
    @chart = Chart.area_chart('LOC/SLOC in time', 1024, 600, data_table)
  end
end
