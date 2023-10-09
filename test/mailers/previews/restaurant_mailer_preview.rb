# Preview all emails at http://localhost:3000/rails/mailers/restaurant_mailer
class RestaurantMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/restaurant_mailer/order_confirmation
  def order_confirmation
    restaurant = Restaurant.first
    order =  Order.first
    RestaurantMailer.order_confirmation(restaurant, order)
  end

end
