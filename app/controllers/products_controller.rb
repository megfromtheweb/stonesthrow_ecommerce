# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = cart
  end

  def show
    @product = Product.find(params[:id])
    @cart = cart
  end
end
