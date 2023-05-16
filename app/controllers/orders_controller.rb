# frozen_string_literal: true

class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @line_items = OrderService.get_line_items(params[:id])
    @cart = cart
    @cart_total = OrderService.get_cart_total(@cart.id)

  end

  def new; end

  def update
    order = Order.find(params[:id])
    OrderService.update_line_item(order.id, params)
    redirect_back(fallback_location: order_path(cart.id))
  end

  private

  def order_params
    params.permit(:product_id)
  end
end
