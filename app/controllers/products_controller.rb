# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = cart
    @cart_total = OrderService.get_cart_total(@cart.id)
  end

  def show
    @product = Product.find(params[:id])
    @cart = cart
    @cart_total = OrderService.get_cart_total(@cart.id)

  end
end
