class MetricsEvolutionController < ApplicationController
  before_filter :set_repositories, only: [:metrics_evolution]
  before_filter :set_branches, only: [:metrics_evolution, :metrics_evolution_filtered]
  before_filter :set_dates, only: [:metrics_evolution]
  before_filter :set_metrics_types, only: [:metrics_evolution]

  ## Metrics Evolution by Branch in time
  def metrics_evolution
    @from += 1.month
  end

  def metrics_evolution_filtered
    @metrics_evo = MetricsEvo
                     .where(date: (from .. to), branch_id: @branches.map(&:id))
                     .order("date asc")

    set_metrics_evolution_chart

    if @metrics_evo.any?
      render :layout => false
    else
      render :text => "No results were found."
    end
  end

  private
  def set_metrics_evolution_chart
    # Add Column Headers
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Date' )
    data_table.new_column('number', 'LOC')    if ['All','LOC'].include?(type)
    data_table.new_column('number', 'SLOC')   if ['All','SLOC'].include?(type)
    data_table.new_column('number', 'Files')  if ['All','Files'].include?(type)

    rows = []
    @metrics_evo.each do |metric_evo|
      row = Array.new
      row.push(metric_evo.date.strftime("%Y-%m-%d"))
      row.push(metric_evo.loc)    if ['All','LOC'].include?(type)
      row.push(metric_evo.sloc)   if ['All','SLOC'].include?(type)
      row.push(metric_evo.files)  if ['All','Files'].include?(type)
      rows.push(row)
    end

    # Add Rows and Values
    data_table.add_rows(rows)
    title = "Metrics Evolution by Branch in time"
    title += " for #{branch.name} branch" unless branch.nil?
    @chart = Chart.area_chart(title, 1024, 600, data_table)
  end
end