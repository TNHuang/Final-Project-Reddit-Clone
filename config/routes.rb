Rails.application.routes.draw do
  root to: "sessions#new"
  resources :users
  resource :session, only: [:new, :create, :destroy]

  resources :subs

  resources :posts do
    resources :comments, only: [:create, :update]
  end

  resources :comments, only: [:show, :destroy]
  #
  # resources :posts do
  #   resources :comments, only: [:new, :create, :edit, :update]
  # end
  #
  # resources :comments, only: [:delete]
end
