class MetricsEvo < ActiveRecord::Base
  self.table_name = :metrics_evo
  attr_accessible :branch_id, :date, :files, :loc, :sloc

  belongs_to :branch

  validates_presence_of :branch, :date, :files, :loc, :sloc
  validates_numericality_of :files, :loc, :sloc, greater_than_or_equal_to: 0, only_integer: true
end
