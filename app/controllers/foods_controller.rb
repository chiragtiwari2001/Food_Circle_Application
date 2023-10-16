class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.find_by(id: params[:category_id])
    authorize @food = Food.new
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    authorize @food = @category.foods.create(food_params)

    if @food.save
      flash[:success] = 'food added to category'
      redirect_to @category
    else
      render 'new', status: :see_other
    end
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :price)
  end
end
