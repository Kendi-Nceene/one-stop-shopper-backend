Rails.application.routes.draw do
  resources :reviews, only: [:index, :create, :update, :destroy]
  resources :products, only: [:index]
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'product-in-carts', to: "product_in_carts#create"
  get 'product-in-carts', to: "product_in_carts#index"
  delete 'product-in-carts/:id', to: "product_in_carts#destroy"
  # get '/products', to: 'products#index'
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get '*path',
      to: 'fallback#index',
      constraints: ->(req) { !req.xhr? && req.format.html? }
end
