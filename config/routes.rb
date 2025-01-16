Rails.application.routes.draw do
  root to: "home#index"
  resources :recipes, only: %i[ create show ]

  get "login", to: "sessions#login"
  get "about", to: "about#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
