

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.manager?
      can :manage, Project, creator_id: user.id
      can :manage, Bug

      
      #can :manage, Bug, creator_id: user.id

      #can :manage, :all
     
     
    elsif user.qa?
    
      
      can :manage, :all
      cannot :update, Project
      cannot :destroy, Project
      cannot :create, Project

    elsif user.developer?
    
      can :read, Project, user_id: user.id
      can :manage,Bug
      can :update,Bug
      cannot :destroy, Bug
      cannot :create, Bug
      can :assign, Bug



      


  end
end
end