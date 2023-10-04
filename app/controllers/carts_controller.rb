class CartsController < ApplicationController
  before_action :authenticate_user!

  def add_cart
    set_cart.cart_items.create(food_id: params[:food])
    redirect_to request.referrer
  end

  def remove_from_cart
    cart_item = set_cart.cart_items.find_by(food_id: params[:food])
    cart_item.destroy
    redirect_to request.referrer
  end
end
