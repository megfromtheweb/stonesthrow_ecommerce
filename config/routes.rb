# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products, only: %i[
    index
    show
  ]
  resources :payments do
    get "success"
  end

  resources :orders, only: %i[
    index
    show
    update
  ]

  resources :orders do
    post "checkout"
    put "packed"
    put "dispatched"
  end

  resources :order_line_items do
    put "increment"
    put "decrement"
  end
end
