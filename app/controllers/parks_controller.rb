class ParksController < ApplicationController

  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
    @reviews = @park.reviews
  end
end
