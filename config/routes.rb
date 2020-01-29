# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  devise_for :users,
  :skip => [:registrations]
  root to: "posts#index"

  devise_scope :user do
    get "/profile", to: "users/registrations#show"
    get "/signup", to: "users/registrations#new", as: :signup
    post "user/sign_up", to: "users/registrations#create", as: :user_registration
  end
end
