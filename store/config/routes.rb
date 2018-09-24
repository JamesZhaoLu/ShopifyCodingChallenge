Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routing for Shops
  resources :shops do
  	member do
      get 'products'
      get 'orders'
  	end
  end

  # Routing for Products
  resources :products

  # Routing for Orders
  resources :orders do
    member do
      get 'line_items'
    end
  end

  # Routing for Line Items
  resources :line_items

end
