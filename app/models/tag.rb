class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :tag_revisions, dependent: :destroy

  validates_presence_of :name
end
