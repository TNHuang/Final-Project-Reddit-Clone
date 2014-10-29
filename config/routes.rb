Rails.application.routes.draw do
  root to: "sign_ins#new"
  resources :users
    
  resources :sign_ins, only: [:new, :create, :destroy]
  delete "sign_out_all_sessions" => "application#sign_out_all_sessions", as: "sign_out_all_sessions"
      
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
