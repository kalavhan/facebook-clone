# frozen_string_literal: true

Rails.application.routes.draw do
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
