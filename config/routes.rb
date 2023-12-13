Rails.application.routes.draw do
  # root to: 'flash#index'
  # get 'flash/index', to: 'flash#index'
  root to: "categories#index"
  
  devise_for :users

  get "/categories", to: "categories#index"
  get "categories/new", to: "categories#new"
  post "/categories", to: "categories#create"
  
  get "/categories/:id/expenses", to: "expenses#index", as: :category_expenses

  get "expenses/new", to: "expenses#new"
  post "/expenses", to: "expenses#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :categories do
    resources :expenses, only: [:new, :create]
  end
  # resources :avatars, only: [:index, :create, :update, :destroy]
  # Defines the root path route ("/")
  # root to: "categories#index"
end
