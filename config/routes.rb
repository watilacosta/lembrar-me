Rails.application.routes.draw do
  resources :appointments
  resources :plans, except: [ :show ]
  resources :payments
  resources :schedules
  resources :services
  resources :services do
    resources :appointments, only: [ :new, :create, :index ]
  end

  resources :subscriptions, only: [ :index, :new, :create ]

  resources :appointments, only: [ :show, :destroy ] do
    member do
      patch :confirm
      patch :cancel
    end
  end

  root "site/home#index"

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  get "up" => "rails/health#show", as: :rails_health_check

  get "dashboard" => "dashboard#index", as: :dashboard

  namespace :webhooks do
    namespace :stripe do
      post "payment_intent/succeeded" => "payment_intent#succeeded"
      post "payment_intent/failed" => "payment_intent#failed"
    end
  end
end
