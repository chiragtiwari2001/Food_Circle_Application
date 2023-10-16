class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize @category = Category.find(params[:id])
    @outlets = @category.restaurants
  end

  def new
    authorize @category = Category.new
  end

  def create
    authorize @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'new category added'
      redirect_to @category
    else
      render 'new', status: :see_other
    end
  end

  def edit
    authorize category = Category.find(params[:id])

  end

  def update
    authorize @category = Category.find(params[:id])

    return unless @category.update(category_params)

    flash[:success] = 'Updated category'
    redirect_to request.referrer
  end

  def destroy
    authorize @category = Category.find(params[:id])

    @category.destroy
    flash[:success] = "Category Deleted"
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :category_image)
  end
end
