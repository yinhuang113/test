class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    if user.role == :admin
      can :manage, :all
    elsif user.role == :agent && user.account_id
      can :manage, Account, id: user.account_id
      can :manage, Mall, account_id: user.account_id
    elsif user.role == :member && user.account_id 
      can :manage, Mall, account_id: user.account_id
    elsif user.role == :observer && user.account_id
      can :read, Mall, account_id: user.account_id
    end
  end
end