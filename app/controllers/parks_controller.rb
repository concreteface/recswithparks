class ParksController < ApplicationController

  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
    @reviews = @park.reviews
    @review = Review.new
    @ratings_options = [1, 2, 3, 4, 5]
  end
end
