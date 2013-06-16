class Chart

  def self.area_chart(title,width, height, data_table)
    option = { width: width, height: height, title: title }
    GoogleVisualr::Interactive::AreaChart.new(data_table, option)
  end

end