# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :find_line_item, only: :update
  def show
    @order = Order.find(params[:id])
    @line_items = @order.order_line_items
    @cart = cart
    @cart_total = @cart.get_total_quantity
  end

  def new; end

  def update
    if @line_item
      @line_item.update_quantity(params[:quantity])
    else
      @order.order_line_items.create(product_id: params[:product_id], quantity: params[:quantity])
    end
    redirect_back(fallback_location: order_path(cart.id))
  end

  private

  def order_params
    params.permit(:product_id)
  end

  def find_line_item
    @order = Order.find(params[:id])
    @line_item = @order.order_line_items.find_by(product_id: params[:product_id])
  end
end
