# frozen_string_literal: true

class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new; end

  def update
    order = Order.find(params[:id])
    return unless params[:product_id]

    OrderService.create_line_item(order.id, params[:product_id])
  end

  private

  def order_params
    params.permit(:product_id)
  end
end
