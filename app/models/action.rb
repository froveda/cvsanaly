class Action < ActiveRecord::Base
  attr_accessible :branch_id, :commit_id, :file_id, :type
end
