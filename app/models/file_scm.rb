class FileScm < ActiveRecord::Base
  set_table_name 'files'
  attr_accessible :file_name, :repository_id

  has_many :file_links
end
