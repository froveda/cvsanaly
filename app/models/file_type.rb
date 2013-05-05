class FileType < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :file_id, :type

end
