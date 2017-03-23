class FileLink < ActiveRecord::Base
  attr_accessible :commit_id, :file_id, :file_path, :parent_id

  belongs_to :commit
  belongs_to :file_scm, foreign_key: :file_id
  belongs_to :parent, class_name: "FileScm"

  validates_presence_of :commit, :file_scm, :file_path
end
