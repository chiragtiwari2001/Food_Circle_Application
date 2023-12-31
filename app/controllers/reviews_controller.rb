class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @review = current_user.reviews.build(reviews_params)
    if @review.save
      flash[:success] = 'review created'
    else
      flash[:danger] = 'could not create review'
    end
    redirect_to request.referrer
  end

  def destroy
    @review.destroy
    flash[:success] = 'Review deleted'
    redirect_to request.referrer || root_path
  end

  private

  def reviews_params
    params.require(:review)
          .permit(:content)
          .merge(restaurant_id: params[:restaurant_id])
  end

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    redirect_to root_path if @review.nil?
  end
end
