# frozen_string_literal: true

Rails.application.routes.draw do
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

  resources :order_line_items do
    put "increment"
    put "decrement"
  end
end
