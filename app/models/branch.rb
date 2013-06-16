class Branch < ActiveRecord::Base
  attr_accessible :name

  has_many :actions
  has_many :metrics_evos

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
