class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @category = Category.find(params[:id])
    @outlets = @category.restaurants
    authorize @category
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    debugger
    @category = Category.create(category_params)
    authorize @category

    if @category.save
      flash[:success] = 'new category added'
      redirect_to @category
    else
      render 'new', status: :see_other
    end
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
    authorize @category

    return unless @category.update(category_params)

    flash[:success] = 'Updated category'
    redirect_to request.referrer
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category

    @category.destroy
    flash[:success] = "Category Deleted"
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :category_image)
  end
end
