Rails.application.routes.draw do
  resources :appointments
  resources :payments
  resources :schedules
  resources :services
  resources :services do
    resources :appointments, only: [ :new, :create, :index ]
  end

  resources :appointments, only: [ :show, :destroy ] do
    member do
      patch :confirm
      patch :cancel
    end
  end

  root "site/home#index"

  devise_for :users, controllers: { sessions: "users/sessions" }

  get "up" => "rails/health#show", as: :rails_health_check

  get "dashboard" => "dashboard#index", as: :dashboard
end
