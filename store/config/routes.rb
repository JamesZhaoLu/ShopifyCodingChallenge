Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routing for Shops
  resources :shops

  # Routing for Products
  resources :products

  # Routing for Orders
  resources :orders

  # Routing for Line Items
  resources :line_items

end
