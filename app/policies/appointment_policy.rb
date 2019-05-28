class AppointmentPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    ; user_is_admin? ;
  end

  def show?
    ; user_is_admin? ;
  end

  def create?
    user.role == 1
  end

  def new?
    ; user_is_admin? ;
  end  

  def update?        
    ; user_is_admin? ;
  end

  def edit?
    ; user_is_admin? ;
  end

  def destroy?
    ; user_is_admin? ;
  end

  private def user_is_admin?    
    user.role == 1
  end

  class Scope < Scope    
    def resolve
      if user.role == 1
        scope.all
      end
    end
  end
end
