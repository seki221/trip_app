Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get "sitelists", to: "sitelists#index"
  get "mypages", to: "mypages#index"

  resources :bookmarks do
    post :create_schedule, on: :member
  end
  resources :planners, only: %i[index new create edit update destroy] do
  resources :schedules, only: %i[index new create show edit update destroy]
  end

end
# get "up" => "rails/health#show", as: :rails_health_check
# Render dynamic PWA files from app/views/pwa/*
# get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
# get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


Rails.application.routes.draw do
  # planページ
  resources :planners, only: %i[index new create show edit update destroy] do
    resources :schedules, only: %i[index new create show edit update destroy] do
      member do
        get :bookmarks
      end
    end
  end
  resources :bookmarks, only: %i[index destroy]
end
