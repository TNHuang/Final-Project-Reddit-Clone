Rails.application.routes.draw do
  root to: "users#new"
  resources :users
  resource :session, only: [:new, :create, :destroy]

  resources :subs do
    # resources :posts do
    #   resources :comments
    # end
  end
end
