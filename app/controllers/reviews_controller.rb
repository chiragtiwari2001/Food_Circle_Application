class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]
  
  def create
    @review = current_user.reviews.build(reviews_params)
    if @review.save
      flash[:success] = "review created"
      redirect_to request.referrer
    else
      flash[:danger] = "could not create review"
      redirect_to request.referrer
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || root_url
  end

  private

    def reviews_params
      params.require(:review)
            .permit(:content)
            .merge(restaurant_id: params[:restaurant_id])
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
    end
end
