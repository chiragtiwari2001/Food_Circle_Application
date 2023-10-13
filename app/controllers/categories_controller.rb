class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: %i[new create edit update destroy]

  def show
    @category = Category.find(params[:id])
    @outlets = @category.restaurants
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'new category added'
      redirect_to @category
    else
      render 'new', status: :see_other
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    return unless @category.update(category_params)

    flash[:success] = 'Updated category'
    redirect_to request.referrer
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category Deleted"
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :category_image)
  end

  def admin_user
    return if current_user.has_role? :admin

    flash[:danger] = 'you dont have access to this action'
    redirect_to root_path
  end
end
