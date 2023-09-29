class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :create, :destroy]
  
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
      flash[:success] = "new category added"
      redirect_to @category
    else
      render 'new', status: :see_other
    end
  end

  def destroy
  end

  private

    def category_params
      params.require(:category).permit(:category_name)
    end

    def admin_user
      unless current_user.has_role? :admin
        flash[:danger]="you dont have access to this action" 
        redirect_to restaurants_path
      end
    end
end
