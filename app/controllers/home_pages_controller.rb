class HomePagesController < ApplicationController
  def home
    # redirect_to new_user_session_path if current_user.nil?
    @categories = Category.all
    @outlets = Restaurant.all
  end

  def help
  end

  def about
  end

  def contact
  end
end
