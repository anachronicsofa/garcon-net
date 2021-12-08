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
  post 'line_item/update_state', to: 'line_items#update_state'
  post 'command/confirm_payment', to: 'commands#confirm_payment'
  post 'commands/create_from_mobile', to: 'commands#create_from_mobile'
  post 'tables/items', to: 'api/tables#items'

  namespace :admin do
    resources :tables
    get 'dashboard', to: 'dashboard#index', as: :dashboard
  end
end
