class Repository < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :name, :type, :uri
end
