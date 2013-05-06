class Repository < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :name, :type, :uri

  has_many :files, :class_name => "FileScm", :foreign_key => :repository_id
end
