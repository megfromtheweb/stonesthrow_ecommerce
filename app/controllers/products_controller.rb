# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    if params[:category]
      @title = "Shop #{params[:category]}"
      @products = Product.send(params[:category])
    else
      @title = "Shop All"
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @title = Product.name
  end

  def showcase
    @title = "Home"
  end
end
