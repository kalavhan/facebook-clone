# frozen_string_literal: true

Rails.application.routes.draw do
  get '/add_friend/:friend_id', to: 'friendships#create', as: :send_request
  put '/accept_friend/:sender_id', to: 'friendships#accept', as: :accept_request
  put '/reject_friend/:sender_id', to: 'friendships#reject', as: :reject_request
  get '/received_requests', to: 'users#show', as: :received_requests
  get '/users', to: "users#index", as: :users
  get '/add_comment/:post_id', to: 'comments#new', as: :show_comment
  post '/add_comment/:post_id', to: 'comments#create', as: :create_comment
  get '/add_like/:post_id', to: 'likes#create', as: :like
  delete '/delete_like/:post_id', to: 'likes#destroy', as: :unlike
  resources :posts
  devise_for :users,
  :skip => [:registrations, :sessions]
  root to: "posts#index"
  
  devise_scope :user do
    get "/profile", to: "users/registrations#show"
    get "/signup", to: "users/registrations#new", as: :signup
    post "user/sign_up", to: "users/registrations#create", as: :user_registration
    post "/signin", to: "users/sessions#create", as: :signin
    get "/edit_user", to: "users/registrations#edit", as: :user_edit
    patch "/edit_user", to: "users/registrations#update" 
    delete "/signout", to: "users/sessions#destroy", as: :signout
  end
end
