class FileLink < ActiveRecord::Base
  attr_accessible :commit_id, :file_id, :file_path, :parent_id

  belongs_to :file_scm, :foreign_key => :file_id
  belongs_to :commit, :foreign_key => :commit_id

  has_one :parent, :class_name => "FileLink", :foreign_key => "parent_id"
end
