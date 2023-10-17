class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    @orders = current_user.orders.page params[:page]
    authorize @orders
  end

  def all_orders
    filter_by_month
    authorize @orders
  end

  def show;  end

  def create_order
    @order = current_user.orders.create(restaurant_id: params[:restaurant])
    add_items_to_order
    calculate_total_amount
    @order.save

    current_user.cart.cart_items.destroy_all
    redirect_to request.referrer
  end

  def order_status
    order = Order.find_by(id: params[:order][:id])
    order.update(order_status: params[:order][:status])

    if order.accepted?
      send_mail_for_confirmation(order)
    else
      send_mail_for_cancellation
    end

    redirect_to all_orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def add_items_to_order
    @cart_items = set_cart.cart_items.includes(:food)

    @cart_items.each do |item|
      @order.order_items.create(food: item.food, quantity: item.quantity)
    end
  end

  def calculate_total_amount
    @order.total_amount = @cart_items.sum do |item|
      (item.food.price * item.quantity).to_i
    end
  end

  def send_mail_for_confirmation(order)
    RestaurantMailer.order_confirmation(order.restaurant, order).deliver_now
    UserMailer.order_confirmation(current_user, order).deliver_now
  end

  def send_mail_for_cancellation
    UserMailer.order_cancel(current_user).deliver_now
  end

  def filter_by_month
    if params.try(:[], :date).try(:[], :month)
      start_date = (Date.today.year.to_s + '-' + params[:date][:month] + '-' + Date.today.day.to_s).to_datetime.beginning_of_month

      end_date = start_date.end_of_month
      @orders = Order.where('created_at BETWEEN ? AND ?', start_date, end_date)
    else
      @orders = Order.all
    end
  end
end
