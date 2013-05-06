class FileLink < ActiveRecord::Base
  attr_accessible :commit_id, :file_id, :file_path, :parent_id

  belongs_to :file_scm, :foreign_key => :file_id
  belongs_to :commit, :foreign_key => :commit_id

  belongs_to :parent, :class_name => "FileScm", :foreign_key => "parent_id"
end
