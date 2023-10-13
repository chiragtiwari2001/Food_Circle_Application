class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @food = Food.new
    authorize @food
  end

  def create
    @food = Food.create(food_params)
    authorize @food

    if @food.save
      flash[:success] = 'food added to category'
      redirect_to request.referrer
    else
      render 'categories/new', status: :see_other
    end
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :price, :category_id)
  end
end
