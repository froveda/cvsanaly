class TagRevision < ActiveRecord::Base
  attr_accessible :commit_id, :tag_id

  belongs_to :commit
  belongs_to :tag

  validates_presence_of :commit, :tag
end
