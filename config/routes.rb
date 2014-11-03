Rails.application.routes.draw do
  root to: "sign_ins#new"

  resources :users

  get '/auth/facebook/callback', to: 'oauthcallbacks#facebook'

  resources :sign_ins, only: [:new, :create, :destroy]
  delete "sign_out_all_sessions" => "application#sign_out_all_sessions", as: "sign_out_all_sessions"

  resources :subs do
    member do
      post "upvote"
      post "downvote"
    end
  end

  resources :posts, except: [ :index ] do
    resources :comments, only: [ :edit, :new, :create, :update]

    member do
      post "upvote"
      post "downvote"
    end
  end

  resources :comments, only: [:show, :destroy] do
    member do
      post "upvote"
      post "downvote"
    end
  end

  namespace :api, :defaults => { :format => :JSON} do
    resources :subs
    resources :posts, except: [ :index ] do
      resources :comments, only: [ :edit, :new, :create, :update]
    end
    resources :comments, only: [:show, :destroy]


    resources :subs do
      member do
        post "upvote"
        post "downvote"
      end
    end


  end

end
