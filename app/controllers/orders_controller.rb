class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create_order
    order = current_user.orders.create(restaurant_id: params[:restaurant])
    cart_items = set_cart.cart_items.includes(:food)

    cart_items.each do |item|
      order.order_items.create(food: item.food, quantity: item.quantity)
    end

    order.total_amount = cart_items.sum do |item|
      (item.food.price * item.quantity).to_i
    end
    order.save

    current_user.cart.cart_items.destroy_all
    redirect_to request.referrer
  end
end
