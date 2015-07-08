class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # in case of guest
    if user
      can :create, Classroom
      can :manage, Classroom do |classroom|
        classroom.users.where(roles: {role: :teacher}).include? user
      end
    end
  end
end
