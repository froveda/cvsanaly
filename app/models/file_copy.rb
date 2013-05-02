class FileCopy < ActiveRecord::Base
  attr_accessible :action_id, :from_commit_id, :from_id, :new_file_name, :to_id
end
