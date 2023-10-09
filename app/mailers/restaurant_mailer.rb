class RestaurantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.restaurant_mailer.order_confirmation.subject
  #
  def order_confirmation(restaurant, order)
    @outlet = restaurant
    @order = order

    mail to: restaurant.restaurant_email, subject: "Order Placed"
  end
end
