class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user && user.admin?
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
