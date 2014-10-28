Rails.application.routes.draw do
  root to: "session#new"
  resources :users
  resource :session, only: [:new, :create, :destroy]

  resources :subs

  resources :posts

  #
  # resources :posts do
  #   resources :comments, only: [:new, :create, :edit, :update]
  # end
  #
  # resources :comments, only: [:delete]
end
