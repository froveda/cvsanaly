class FileCopy < ActiveRecord::Base
  attr_accessible :to_id, :from_id, :from_commit_id, :new_file_name, :action_id

  belongs_to :action
  belongs_to :commit, :class_name => "Commit", :foreign_key => :from_commit_id
  belongs_to :from, :class_name => "FileScm", :foreign_key => :from_id
  belongs_to :to, :class_name => "FileScm", :foreign_key => :to_id
end
