# frozen_string_literal: true

class OrderLineItemsController < ApplicationController
  before_action :find_line_item

  def increment
    @line_item.increase_quantity(params[:increment])
    redirect_back(fallback_location: order_path(cart.id))
  end

  def decrement
    @line_item.decrease_quantity(params[:decrement])
    redirect_back(fallback_location: order_path(cart.id))
  end

  private

  def order_line_item_params
    params.permit(:increment, :decrement)
  end

  def find_line_item
    @line_item = OrderLineItem.find(params[:order_line_item_id])
  end
end