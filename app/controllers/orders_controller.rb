# frozen_string_literal: true

class OrdersController < ApplicationController
  def new

  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    if params[:product_id]
      OrderService.create_list_item(order.id, params[:product_id])
    end
  end

  private

  def order_params
    params.permit(:product_id)
  end

end
