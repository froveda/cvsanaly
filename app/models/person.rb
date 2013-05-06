class Person < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :commits, :foreign_key => :committer_id
  has_many :author_commits, :class_name => "Commit", :foreign_key => :author_id
end
