class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def order?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    is_admin? && correct_admin?(record)
  end

  def edit?
    update?
  end

  def update?
    is_admin? && correct_admin?(record)
  end

  def destroy?
    is_admin? && correct_admin?(record)
  end

  def correct_admin?(restaurant)
    @user.email == restaurant.restaurant_email
  end
end
