class FoodsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @food = @category.foods.create(food_params)
    
    if @food.save
      flash[:suuccess] = "food added to category"
      redirect_to @category
    else
      render 'categories/new', status: :see_other
    end
  end

  private

    def food_params
      params.require(:food).permit(:food_name, :price)
    end
end
