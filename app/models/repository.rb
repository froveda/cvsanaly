class Repository < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :name, :type, :uri

  has_many :files, :class_name => "FileScm", :foreign_key => :repository_id
  has_many :actions, through: :files
  has_many :branches, through: :actions, uniq: true

  has_many :commits
  has_many :committers, through: :commits, uniq: true

  #RailsAdmin
  rails_admin do
    list do
      field :name
      field :type
      field :uri
    end

    show do
      field :name
      field :type
      field :uri
    end
  end
end
