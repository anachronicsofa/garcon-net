Rails.application.routes.draw do
  resources :commands
  resources :line_items
  resources :products
  resources :menus
  resources :users
  resources :orders
  resources :tables
  resources :companies
end
