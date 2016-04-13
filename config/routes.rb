Rails.application.routes.draw do
  devise_for :users
  root to: "parks#index"

  resources :parks do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create, :edit, :destroy]
  end

  resources :votes, only: [:create, :update, :destroy]

  resources :users, only: [:index, :show, :destroy]

  resources :reviews, only: [:index, :destroy]
end
