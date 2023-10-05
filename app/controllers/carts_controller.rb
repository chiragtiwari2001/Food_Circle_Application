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

  def cart_update
    cart_item = set_cart.cart_items
                        .find_by(food_id: params[:cart_item][:food_id])
    cart_item.update(quantity: params[:cart_item][:quantity])
    redirect_to request.referrer
  end
end
