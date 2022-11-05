class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, Post, public: true
    return unless current_user.present?

    can :read, :all
    can :manage, Post, author: current_user
    can :manage, Comment, author: current_user
    return unless current_user.role == 'admin' # additional permissions for administrators

    can :manage, :all
  end
end
