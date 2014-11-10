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

    resources :subs do
      member do
        post "upvote"
        post "downvote"
      end
    end

    post "/posts/:id/change_img_url", to: "posts#change_img_url", as: "change_img_url"

    post "/subs/:id/subscribe", to: "subs#subscribe", as: "sub_subscribe"
    delete "/subs/:id/unsubscribe", to: "subs#unsubscribe", as: "sub_unsubscribe"

    post "/posts/:id/xpost", to: "posts#xpost", as: "post_xpost"

    get "/multisearch", to: "subs#multisearch", as: "multi_search"

    post "/chat", to: "subs#chat", as: "chat_room"
  end

end
