class CartPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def add_to_cart?
    correct_user_cart?(record)
  end

  def remove_from_cart?
    correct_user_cart?(record)
  end

  def cart_update?
    correct_user_cart?(record)
  end

  def correct_user_cart?(cart)
    @user.id == cart.user_id
  end
end
