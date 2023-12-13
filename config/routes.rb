Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  } 
  
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root 'flash#index', as: :unauthenticated_root
  end

  root to: 'flash#index'
  
  get "/categories", to: "categories#index"
  get "categories/new", to: "categories#new"
  post "/categories", to: "categories#create"
  
  get "/categories/:id/expenses", to: "expenses#index", as: :category_expenses

  get "expenses/new", to: "expenses#new"
  post "/expenses", to: "expenses#create"
  
  get "up" => "rails/health#show", as: :rails_health_check

  resources :categories, only: %i[index new show create] do
    resources :expenses, only: %i[index new create edit update destroy]
  end
end
