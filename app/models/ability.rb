class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user && !user.new_record?
      # All registered users
      can :read, :all

      # Different roles
      if user.admin?
        can :access, :rails_admin
        can :manage, :all
      end
    end
  end
end
