class FileScm < ActiveRecord::Base
  self.table_name = :files
  attr_accessible :file_name, :repository_id

  has_many :actions, foreign_key: :file_id, dependent: :destroy
  has_many :copied_from, class_name: "FileCopy", foreign_key: :from_id, dependent: :destroy
  has_many :copied_to, class_name: "FileCopy", foreign_key: :to_id, dependent: :destroy
  has_many :metrics, foreign_key: :file_id, dependent: :destroy
  has_one :type, class_name: "FileType", foreign_key: :file_id, dependent: :destroy
  has_many :file_links, foreign_key: :file_id, dependent: :destroy
  belongs_to :repository

  validates_presence_of :file_name, :repository

  ## RailsAdmin
  def title
    self.file_name
  end

  rails_admin do
    list do
      field :file_name
      field :repository
    end

    show do
      field :file_name
      field :repository
    end
  end
end
