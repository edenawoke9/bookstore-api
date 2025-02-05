Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:create]
  resources :sessions

  resources :books, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index, :show, :create]
  resources :carts, only: [:show, :update]
  resources :orders, only: [:index, :show, :create]
  resources :payments, only: [:create]
  resources :reviews, only: [:index, :create]
  resources :users, only: [:create]

  # Defines the root path route ("/")
  # root "posts#index"
end


