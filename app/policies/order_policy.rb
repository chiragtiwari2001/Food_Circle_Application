class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def all_orders?
    is_admin?
  end

  def create_order?
    true
  end

  def order_status?
    is_admin?
  end
end
