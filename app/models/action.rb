class Action < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :branch_id, :commit_id, :file_id, :type

  belongs_to :commit, :foreign_key => :commit_id
  belongs_to :file_scm, :foreign_key => :file_id
  belongs_to :branch

  has_many :file_copies

  def type
    type_letter = read_attribute(:type)
    return "Add" if(type_letter.eql?("A"))
    return "Modified" if(type_letter.eql?("M"))
    return "Deleted" if(type_letter.eql?("D"))
    return "Moved (Renamed)" if(type_letter.eql?("V"))
    return "Copied" if(type_letter.eql?("C"))
    return "Replaced" if(type_letter.eql?("R"))
  end
end
