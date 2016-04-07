class VotesController < ApplicationController
  include ApplicationHelper
  def create
    @user = current_user
    @review = Review.find(params[:review_id])
    vote = str_to_bool(params[:vote])

    if @user.vote(vote, @review)
      render json: { results: 'success' }
    else
      render json: { results: 'duplicate' }
    end
  end
end
