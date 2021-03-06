class ParksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :search]

  def index
    @parks = Park.all.page params[:page]
  end

  def show
    @park = Park.find(params[:id])
    @reviews = @park.reviews
    @review = Review.new
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.user = current_user
    if @park.save
      redirect_to @park
    else
      flash[:alert] = @park.errors.full_messages.join(", ")
      render :new
    end
  end

  def search
    @query = params[:query]
    @search_results = Park.search(@query)
  end

  def destroy
    @park = Park.find(params[:id])
    @park.reviews.delete
    @park.delete
    render json: { results: "success" }
  rescue ActiveRecord::DeleteRestrictionError
    render json: "failure"
  end

  private

  def park_params
    params.require(:park).permit(:name, :street, :description)
  end
end
