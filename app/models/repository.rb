class Repository < ActiveRecord::Base
  attr_accessible :name, :type, :uri
end
