Rails.application.routes.draw do
  devise_for :users
  root "legos#index"

  resources :legos
  resources :messages, only: [ :index, :new, :create ]

  resources :legos do
    member do
      patch :toggle_hidden
    end
    collection do
      get :filter
    end
    resources :opinions, only: [ :create, :edit, :update, :destroy ]
    patch :toggle_hidden, on: :member
  end

  namespace :admin do
    resources :opinions do
      resources :responses, only: [ :create, :edit, :update, :destroy ]
    end
    
    resources :messages do
      resource :replies, only: [ :new, :create ]
      member do
        patch :mark_as_read
      end
    end
  end

  resources :opinions do
    resources :responses, only: [ :new, :create, :edit, :update, :destroy ]
  end

  resources :description

  resource :cart, only: [ :show ] do
    post "add_item/:id", to: "carts#add_item", as: :add_item
    delete "remove_item/:item_id", to: "carts#remove_item", as: :remove_item
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
