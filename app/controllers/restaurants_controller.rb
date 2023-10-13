class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_admin_for_restaurant, only: %i[edit update destroy]
  before_action :admin_user, only: %i[new create edit update destroy]

  def index
    @outlets = Restaurant.all.page params[:page]
  end

  def order
    @outlet = Restaurant.find(params[:restaurant_id])
    @food_by_category = @outlet.foods.includes(:category)
                               .group_by { |food| food.category }
  end

  def show
    find_restaurant
    @food_by_category = @outlet.foods.includes(:category)
                               .group_by { |food| food.category }
  end

  def new
    @outlet = Restaurant.new
  end

  def create
    @outlet = Restaurant.create!(restaurant_params)

    if @outlet.save
      flash[:success] = "New Restaurant Added"
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
      flash[:success] = "Restaurant details updated"
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
    params.require(:restaurant).permit(:restaurant_name, :restaurant_email, :restaurant_details, :restaurant_address,
                                       :restaurant_contact, :restaurant_image, :status, category_ids: [], food_ids: [])
  end

  def find_restaurant
    @outlet = Restaurant.find(params[:id])
  end

  def admin_user
    return if current_user.has_role? :admin

    flash[:danger] = 'you dont have access to this action'
    redirect_to restaurants_path
  end
end
