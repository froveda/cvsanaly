class MetricsEvo < ActiveRecord::Base
  set_table_name 'metrics_evo'
  attr_accessible :branch_id, :date, :files, :loc, :sloc
end
