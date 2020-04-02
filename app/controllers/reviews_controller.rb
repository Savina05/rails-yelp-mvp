class ReviewsController < ApplicationController
  before_action :set_restaurant

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save

    redirect_to restaurant_path(@restaurant.id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@restaurant.id)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
