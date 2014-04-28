class Ability
  include CanCan::Ability

  def initialize(current_admin)
    if current_admin.admin?
      can :manage, :all
    end  

    if current_admin.gm?
    	can :read, :all
      can :manage, SysMsg
    end

    if current_admin.guest?
      can :read, :all
    end

  end
end
