Rails.application.routes.draw do
  root "products#index"
  resources :products, only: [
    :index,
    :show
  ]
  # get "/products", to: "products#index"
  # get "/products/:id", to: "products#show", as: 'show_product' 
end
