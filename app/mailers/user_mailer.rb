class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.order_cancel.subject
  #
  
  def order_confirmation(user, order)
    @user = user
    @order = order

    mail to: user.email, subject: "Order Placed"
  end

  def order_cancel(user)
    @user = user
    mail to: user.email, subject: "Order Canceled"
  end
end
