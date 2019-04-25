class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, SecretCode if user.admin?
  end
end
