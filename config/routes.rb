Rails.application.routes.draw do
  resources :addresses
  get 'shopping_cart', to: 'shopping_carts#show'
  get 'shopping_cart/add/:ticket_type_id/:amount', to: 'shopping_carts#add_ticket', defaults: { amount: 1 }
  post 'shopping_cart/add', to: 'shopping_carts#add_ticket'
  get 'shopping_cart/update/:ticket_type_id/:amount', to: 'shopping_carts#update', :defaults => { :format => 'json' }
  post 'shopping_cart/update', to: 'shopping_carts#update', :defaults => { :format => 'json' }
  get 'checkout', to: 'orders#new'
  get 'home/index'
  resources :orders
  devise_for :users
  resources :products
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
