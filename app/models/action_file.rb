class ActionFile < ActiveRecord::Base
  attr_accessible :action_id, :action_type, :commit_id, :file_id
end
