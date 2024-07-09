Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "static#dashboard"
  get 'people/:id', to: 'static#person'

  post '/dashboard', to: 'static#dashboard'
  resources :expense_details 
  resources :expenses
  resources :balances
  resources :users, only: [:index, :show]
  resources :static
end
