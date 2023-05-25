# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @title = "Shop All"
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @title = Product.name
  end
end
