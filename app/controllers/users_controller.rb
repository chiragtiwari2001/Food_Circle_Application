class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = policy_scope(User).all.page params[:page]
    authorize @users
  end

  def profile
    @user = User.find_by(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      flash[:success] = "Role updated for #{@user.username}"
      redirect_to users_path
    else
      render 'edit', status: :see_other
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user

    @user.destroy
    flash[:success] = "User Deleted!"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit({role_ids: []})
  end
end
