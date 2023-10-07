class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def all_orders
    @orders = Order.all
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

  def order_status
    order = Order.find_by(id: params[:order][:id])
    order.update(order_status: params[:order][:status])

    if order.accepted?
      RestaurantMailer.order_confirmation(order.restaurant, order).deliver_now
      UserMailer.order_confirmation(current_user, order).deliver_now
    else
      UserMailer.order_cancel(current_user).deliver_now
    end
  end
end
