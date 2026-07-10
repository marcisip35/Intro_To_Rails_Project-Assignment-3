Rails.application.routes.draw do
  root "breeds#index"
  resources :breeds, only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check
end