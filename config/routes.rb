Rails.application.routes.draw do

  devise_for :users
  root to: "parks#index"

  resources :parks do
    resources :reviews, only: [:create, :edit, :destroy]
  end

  resources :votes, only: [:create, :update, :destroy]

end
