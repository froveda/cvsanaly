class FileLink < ActiveRecord::Base
  attr_accessible :commit_id, :file_id, :file_path, :parent_id
end
