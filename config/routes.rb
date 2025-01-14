Rails.application.routes.draw do
  root to: "home#index"
  resources :recipes, only: %i[ create show ]

  get "login", to: "sessions#login"

  get "up" => "rails/health#show", as: :rails_health_check
end
