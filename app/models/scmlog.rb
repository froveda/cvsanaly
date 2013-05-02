class Scmlog < ActiveRecord::Base
  attr_accessible :author_id, :committer_id, :composed_rev, :date, :message, :repository_id, :rev
end
