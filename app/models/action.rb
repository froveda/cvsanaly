class Action < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :branch_id, :commit_id, :file_id, :type

  belongs_to :commit, :foreign_key => :commit_id
  belongs_to :file_scm, :foreign_key => :file_id
  belongs_to :branch

  has_many :file_copies

  ## RailsAdmin
  def title
    "#{self.type} #{self.file_scm.title} to #{self.commit.title}"
  end
end
