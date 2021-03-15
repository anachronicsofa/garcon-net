Rails.application.routes.draw do
  resources :commands
  resources :line_items
  resources :products
  resources :menus
  resources :users
  resources :orders
  resources :tables
  resources :companies

  get 'welcome', to: 'landing#index', as: :welcome
  get 'register', to: 'landing#register', as: :register
end
