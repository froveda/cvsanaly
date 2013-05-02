class Action < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :branch_id, :commit_id, :file_id, :type
end
