Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  # davise関係
  # devise_for :users, controllers: {
  #   # omniauth_callbacks: "users/omniauth_callbacks"
  #   # registrations: 'users/registrations',
  #   # sessions: 'users/sessions',
  # }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  resources :planners, only: %i[index new create show edit update destroy] do
  end

  # get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
