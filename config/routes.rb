Rails.application.routes.draw do
  devise_for :users

  root to: 'flash#index'
  
  get "/categories", to: "categories#index"
  get "categories/new", to: "categories#new"
  post "/categories", to: "categories#create"
  get 'flash/index'
  get "/categories/:id/expenses", to: "expenses#index", as: :category_expenses

  get "expenses/new", to: "expenses#new"
  post "/expenses", to: "expenses#create"
  
  get "up" => "rails/health#show", as: :rails_health_check

  get "/expenses", to: "expenses#index"

  resources :categories, only: %i[index new show create] do
    resources :expenses, only: %i[index new create edit update destroy]
  end
end
