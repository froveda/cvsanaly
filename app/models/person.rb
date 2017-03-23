class Person < ActiveRecord::Base
  attr_accessible :email, :name

  # A person can be a committer for some commits, and an author for others
  has_many :commits, foreign_key: :committer_id
  has_many :author_commits, class_name: "Commit", foreign_key: :author_id

  # The email format is not validated since it comes from cvsanaly conversion,
  # and the email depends on the CVS (it may have a non email format)
  validates_presence_of :email, :name
end
