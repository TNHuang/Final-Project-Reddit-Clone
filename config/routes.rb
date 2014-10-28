Rails.application.routes.draw do
  root to: "users#new"
  resources :users
  resource :session, only: [:new, :create, :destroy]

  resources :subs do
    # resources :posts, only: [:new, :create, :edit, :update]
  end

  # resources :posts, only: [:delete]
  #
  # resources :posts do
  #   resources :comments, only: [:new, :create, :edit, :update]
  # end
  #
  # resources :comments, only: [:delete]
end
