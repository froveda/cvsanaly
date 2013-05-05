class Commit < ActiveRecord::Base
  set_table_name 'scmlog'
  attr_accessible :author_id, :committer_id, :composed_rev, :date, :message, :repository_id, :rev

  has_many :actions, :class_name => "Action", :foreign_key => "commit_id"
end
