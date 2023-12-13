Rails.application.routes.draw do
  devise_for :users

  root to: 'flash#index'
  
  get "up" => "rails/health#show", as: :rails_health_check

  resources :categories, only: %i[index new show create] do
    resources :expenses, only: %i[index new create edit update destroy]
  end
end
