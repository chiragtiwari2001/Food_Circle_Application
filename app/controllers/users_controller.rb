class UsersController < ApplicationController
  def index
    @users = User.all.page params[:page]
  end

  def show
    @user = User.find_by(id: current_user.id)
  end
end
