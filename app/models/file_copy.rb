class FileCopy < ActiveRecord::Base
  attr_accessible :action_id, :from_commit_id, :from_id, :to_id, :new_file_name

  belongs_to :action
  belongs_to :commit, class_name: "Commit", foreign_key: :from_commit_id
  belongs_to :from, class_name: "FileScm"
  belongs_to :to, class_name: "FileScm"

  validates_presence_of :action, :commit, :from, :to, :new_file_name
end
