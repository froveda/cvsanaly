class FileScm < ActiveRecord::Base
  set_table_name :files
  attr_accessible :file_name, :repository_id

  has_many :actions, foreign_key: :file_id
  has_many :copied_from, class_name: "FileCopy", foreign_key: :from_id
  has_many :copied_to, class_name: "FileCopy", foreign_key: :to_id
  has_many :metrics, foreign_key: :file_id
  has_one :type, class_name: "FileType", foreign_key: :file_id
  belongs_to :repository

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
