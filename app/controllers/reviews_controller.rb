class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant, notice: "Your review was successfully created."
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
