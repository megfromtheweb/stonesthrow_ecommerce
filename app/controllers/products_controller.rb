# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    if category.present?
      @title = "Shop #{category}"
      @products = Product.where(category: category)
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

  private 
  
  def category
    params.permit(:category)[:category]
  end
end
