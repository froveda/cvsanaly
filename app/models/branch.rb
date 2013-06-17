class Branch < ActiveRecord::Base
  attr_accessible :name

  has_many :actions
  has_many :metrics_evos

  def self.branches_by_repository(repository)
    repository.files.joins(:actions).select("distinct(actions.branch_id)").collect{|file| Branch.find(file.branch_id)}
  end

  ## RailsAdmin
  rails_admin do
    list do
      field :name
    end

    show do
      field :name
    end
  end
end
