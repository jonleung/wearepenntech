class Ability
  include CanCan::Ability

  def initialize(u)
    u ||= User.new

    ##################################
    # Users
    can :read, :all
    can :update, User do |user|
      u.id == user.id
    end

    ##################################
    # Projects
    can :create, Project do |project|
      !u.new_record?
    end
    can :manage, Project do |project|
      project.user == u
    end

    ##################################
    # Comments

    can :create, Comment 
    # can :update, Comment do |comment|
    #   comment.creator == u
    # end

    # can :destroy, Comment do |comment|
    #   if comment.creator == u
    #     true
    #   elsif (user = commentable).class == User
    #     user == u
    #   elsif (project = commentable).class == Project
    #     project.user == u
    #   end
    # end

  end
end
