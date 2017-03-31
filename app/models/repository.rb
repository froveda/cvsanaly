class Repository < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :name, :type, :uri

  has_many :files, class_name: "FileScm", dependent: :destroy
  has_many :actions, through: :files
  has_many :branches, through: :actions, uniq: true, dependent: :destroy

  has_many :commits, dependent: :destroy
  has_many :committers, through: :commits, uniq: true

  validates_presence_of :name, :type, :uri

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
