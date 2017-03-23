class CommitsLine < ActiveRecord::Base
  attr_accessible :added, :commit_id, :removed

  belongs_to :commit
end
