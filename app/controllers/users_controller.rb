class UsersController < ApplicationController

  before_filter :authorize, only: :index
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  private

  def authorize
    unless current_user.try(:admin?)
      flash[:error] = 'You lack the necessary permission to view this page'
      redirect_to root_path
    end
  end
end
