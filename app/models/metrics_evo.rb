class MetricsEvo < ActiveRecord::Base
  self.table_name = :metrics_evo
  attr_accessible :branch_id, :date, :files, :loc, :sloc

  belongs_to :branch
end
