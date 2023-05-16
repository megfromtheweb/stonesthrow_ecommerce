# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = cart
    @cart_total = @cart.get_total_quantity
  end

  def show
    @product = Product.find(params[:id])
    @cart = cart
    @cart_total = @cart.get_total_quantity
  end
end
