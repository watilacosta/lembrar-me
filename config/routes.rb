Rails.application.routes.draw do
  resources :payments
  resources :schedules
  resources :appointments
  resources :services
  devise_for :users

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

  get "up" => "rails/health#show", as: :rails_health_check
end
