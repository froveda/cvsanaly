class Commit < ActiveRecord::Base
  set_table_name 'scmlog'

  attr_accessible :author_id, :committer_id, :composed_rev, :date, :message, :repository_id, :rev

  has_many :actions, :class_name => "Action", :foreign_key => :commit_id
  has_many :file_copies, :foreign_key => :from_commit_id
  has_many :tag_revisions, :foreign_key => :commit_id
  has_many :metrics

  belongs_to :author, :class_name => "Person", :foreign_key => :author_id
  belongs_to :commiter, :class_name => "Person", :foreign_key => :committer_id
  belongs_to :repository

  def revision_str
    "Rev " + self.rev
  end

  ## RailsAdmin
  def title
    self.revision_str
  end
end
