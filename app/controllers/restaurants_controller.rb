class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @outlets = Restaurant.all.page params[:page]
    authorize @outlets
  end

  def order
    @outlet = Restaurant.find(params[:restaurant_id])
    authorize @outlet
    food_by_category
  end

  def show
    food_by_category
  end

  def new
    authorize @outlet = Restaurant.new
  end

  def create
    authorize @outlet = Restaurant.new(restaurant_params)

    if @outlet.save
      flash[:success] = 'New Restaurant Added'
      redirect_to restaurants_path
    else
      render 'new', status: :see_other
    end
  end

  def edit;  end

  def update
    if @outlet.update(restaurant_params)
      flash[:success] = 'Restaurant details updated'
      redirect_to @outlet
    else
      render 'edit', status: :see_other
    end
  end

  def destroy
    @outlet.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :restaurant_email, :restaurant_details, :restaurant_address,
                                       :restaurant_contact, :restaurant_image, :status, category_ids: [], food_ids: [])
  end

  def set_restaurant
    @outlet = Restaurant.find(params[:id])
    authorize @outlet
  end

  def food_by_category
    @food_by_category = @outlet.foods.includes(:category)
                               .group_by { |food| food.category }
  end
end
