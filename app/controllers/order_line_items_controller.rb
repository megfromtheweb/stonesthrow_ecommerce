# frozen_string_literal: true

class OrderLineItemsController < ApplicationController
  before_action :find_line_item

  def increment
    @line_item.increase_quantity(increment)
    redirect_back(fallback_location: order_path(cart.id))
  end

  def decrement
    @line_item.decrease_quantity(decrement)
    @line_item.destroy_if_zero
    redirect_back(fallback_location: order_path(cart.id))
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: order_path(cart.id))
  end

  private

  def id
    params.permit(:id)[:id]
  end

  def order_line_item_id
    params.permit(:order_line_item_id)[:order_line_item_id]
  end

  def increment
    params.permit(:increment)[:increment]
  end

  def decrement
    params.permit(:decrement)[:decrement]
  end

  def find_line_item
    @line_item = OrderLineItem.find(order_line_item_id || id)
  end
end
