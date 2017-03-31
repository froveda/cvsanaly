class Branch < ActiveRecord::Base
  attr_accessible :name

  has_many :actions, dependent: :destroy
  has_many :metrics_evos, dependent: :destroy

  validates_presence_of :name

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
