# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "products#showcase"
  resources :products, only: %i[
    new
    create
    edit
    index
    update
    show
  ]

  get '/listings', to: 'products#listings', as: 'listings'
  


  resources :payments do
    get "success"
  end

  resources :orders, only: %i[
    index
    show
    update
  ]

  resources :orders do
    get "checkout"
    put "packed"
    put "dispatched"
  end

  resources :order_line_items do
    put "increment"
    put "decrement"
  end
end
