class MetricsEvo < ActiveRecord::Base
  attr_accessible :branch_id, :date, :files, :loc, :sloc
end
