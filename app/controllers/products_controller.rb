# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    if category.present?
      @title = "Shop #{category}"
      @products = Product.in_stock.where(category: category)
    else
      @title = "Shop All"
      @products = Product.in_stock
    end
  end

  def new
    return not_found unless current_user && current_user.is_admin?

    @title = "New Listing"
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.valid?
      respond_to do |format|
        format.html { redirect_to product_path(@product), notice: 'Product was successfully created.' }
      end
    else
      render :new
    end
  end

  def show
    @product = Product.find(id)
    @title = Product.name
  end

  def showcase
    @title = "Home"
  end

  def listings
    return not_found unless current_user && current_user.is_admin?


    @products = Product.all
    @title = "Listings"
  end

  private 

  def product_params
    params.require(:product).permit(:name, :sku, :price, :quantity)
  end

  def id
    params.permit(:id)[:id]
  end
  
  def category
    params.permit(:category)[:category]
  end
end
