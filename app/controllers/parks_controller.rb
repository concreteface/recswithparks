class ParksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @parks = Park.all.page params[:page]
  end

  def show
    @park = Park.find(params[:id])
    @reviews = @park.reviews
    @review = Review.new
    @ratings_options = [1, 2, 3, 4, 5]
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to @park
    else
      flash[:alert] = @park.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def park_params
    params.require(:park).permit(:name, :street, :description)
  end
end
