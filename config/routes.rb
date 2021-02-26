Rails.application.routes.draw do
  resources :commands
  resources :line_items
  resources :products
  resources :menus
  resources :users
  resources :orders
  resources :tables
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
