class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @outlets = Restaurant.all
  end

  def order
    @outlet = Restaurant.find(params[:restaurant_id])
  end

  def show
    find_restaurant
  end

  def new
    @outlet = Restaurant.new
  end

  def create
    @outlet = Restaurant.create!(restaurant_params)
    
    if @outlet.save
      redirect_to restaurants_path
    else
      render 'new', status: :see_other
    end
  end

  def edit
    find_restaurant
  end

  def update
    find_restaurant

    if @outlet.update(restaurant_params)
      redirect_to @outlet
    else
      render 'edit', status: :see_other
    end
  end

  def destroy
    find_restaurant
    @outlet.destroy
    redirect_to restaurants_path
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:restaurant_name, :restaurant_email, :restaurant_details, :restaurant_address, :restaurant_contact, :status, category_ids: [])
    end

    def find_restaurant
      @outlet = Restaurant.find(params[:id])
    end

    def admin_user
      unless current_user.has_role? :admin
        flash[:danger]="you dont have access to this action" 
        redirect_to restaurants_path
      end
    end
end
