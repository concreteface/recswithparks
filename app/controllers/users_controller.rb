class UsersController < ApplicationController

  before_filter :authorize, only: :index

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def destroy
    if User.find(params[:id]).delete
      render json: {results: "success" }
    else
      render json: "failure"
    end
  end

  private

  def authorize
    unless current_user.try(:admin?)
      flash[:alert] = 'You lack the necessary permission to view this page'
      redirect_to root_path
    end
  end
end
