# frozen_string_literal: true

Rails.application.routes.draw do
  root "products#index"
  resources :products, only: %i[
    index
    show
  ]
  resources :payments do
    post "create"
    get "success"
  end
end
