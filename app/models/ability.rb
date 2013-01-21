class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    
    can :request_access, User
    can :read, Mall, account_id: user.account_id if user.account_id
    
    if user.role == :admin
      can :manage, :all
    elsif user.role == :agent && user.account_id
      can :manage, Account, id: user.account_id
      can :manage, Mall, account_id: user.account_id
      can :manage, User, account_id: user.account_id
    elsif user.role == :member && user.account_id 
      can :manage, Mall, account_id: user.account_id
      can :manage, User, id: user.id
    end
  end
end
