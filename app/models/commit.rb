class Commit < ActiveRecord::Base
  self.table_name = :scmlog

  attr_accessible :author_id, :committer_id, :composed_rev, :date, :message, :repository_id, :rev

  has_many :actions, class_name: "Action", foreign_key: :commit_id
  has_many :file_copies, foreign_key: :from_commit_id
  has_many :tag_revisions, foreign_key: :commit_id
  has_many :metrics

  belongs_to :author, class_name: "Person"
  belongs_to :committer, class_name: "Person"
  belongs_to :repository

  ## RailsAdmin
  def title
    "Rev #{rev}"
  end
end
