Rails.application.routes.draw do
  root to: "home#index"
  resources :recipes, only: %i[ create show ]
  resources :user, only: %i[ destroy ]
  resources :sessions, only: %i[ create show ]

  get "signup", to: "users#signup"
  get "login", to: "sessions#login"
  get "logout", to: "sessions#logout"
  get "about", to: "about#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
