class CommitsLine < ActiveRecord::Base
  attr_accessible :added, :commit_id, :removed

  belongs_to :commit, :foreign_key => :commit_id
end
