Rails.application.routes.draw do
  devise_for :users

  resources :commands
  resources :line_items
  resources :products
  resources :menus
  resources :orders
  resources :tables
  resources :companies
  resources :users

  root to: 'landing#index'
  get 'welcome', to: 'landing#index', as: :welcome
  get 'register', to: 'landing#register', as: :register
end
