class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @park = Park.find(params[:park_id])
    @review = Review.new(review_params)
    @review.park = @park
    @user = current_user
    @review.user = @user
    if @review.save
      ReviewMailer.new_review(@review).deliver_later
      flash[:notice] = "Your review has been added successfully."
      redirect_to park_path(@park)
    else
      flash[:notice] = @reviews.errors.full_messages.join(", ")
      render 'parks/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    render json: {results: "success" }
  rescue ActiveRecord::DeleteRestrictionError
    render json: "failure"
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
