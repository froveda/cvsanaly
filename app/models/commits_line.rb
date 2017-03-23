class CommitsLine < ActiveRecord::Base
  attr_accessible :added, :commit_id, :removed

  belongs_to :commit

  validates_presence_of :commit, :added, :removed
  validates_numericality_of :added, :removed, greater_than_or_equal_to: 0, only_integer: true
end
