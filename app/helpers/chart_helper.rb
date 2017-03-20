module ChartHelper
  def area_chart(title,width, height, data_table)
    option = { width: width, height: height, title: title }
    GoogleVisualr::Interactive::AreaChart.new(data_table, option)
  end

  def loc_sum_by_date_chart(commits)
    # Add Column Headers
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Date' )
    data_table.new_column('number', 'LOC')
    data_table.new_column('number', 'SLOC')

    # Set the table data
    rows = commits.collect{|commit| [commit.date.strftime("%Y-%m-%d"), commit.loc, commit.sloc] }

    # Add data and values to the table
    data_table.add_rows(rows)

    # Create an area chart
    return area_chart('LOC/SLOC in time', 1024, 600, data_table)
  end

  def modifications_amount_by_commit_chart(commits_hash, modification)
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
    commits_hash.each_pair do |key, value|
      row = Array.new()
      row.push(key)
      row.push(value['A'] || 0) if ['','A'].include?(modification)
      row.push(value['M'] || 0) if ['','M'].include?(modification)
      row.push(value['D'] || 0) if ['','D'].include?(modification)
      row.push(value['V'] || 0) if ['','V'].include?(modification)
      row.push(value['C'] || 0) if ['','C'].include?(modification)
      row.push(value['R'] || 0) if ['','R'].include?(modification)
      rows.push(row)
    end

    # Add Rows and Values
    data_table.add_rows(rows)
    return area_chart('SUM of Files Modified in time', 1024, 600, data_table)
  end

  def metrics_evolution_chart(metrics_evo, type, branch)
    # Add Column Headers
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Date' )
    data_table.new_column('number', 'LOC')    if ['All','LOC'].include?(type)
    data_table.new_column('number', 'SLOC')   if ['All','SLOC'].include?(type)
    data_table.new_column('number', 'Files')  if ['All','Files'].include?(type)

    rows = []
    metrics_evo.each do |metric_evo|
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
    return area_chart(title, 1024, 600, data_table)
  end
end