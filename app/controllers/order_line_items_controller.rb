# frozen_string_literal: true

class OrderLineItemsController < ApplicationController
  before_action :find_line_item

  def increment
    @line_item.increase_quantity(params[:increment])
    redirect_back(fallback_location: order_path(cart.id))
  end

  def decrement
    @line_item.decrease_quantity(params[:decrement])
    @line_item.destroy_if_zero
    redirect_back(fallback_location: order_path(cart.id))
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: order_path(cart.id))
  end

  private

  def order_line_item_params
    params.permit(:increment, :decrement)
  end

  def find_line_item
    if params[:order_line_item_id]
      @line_item = OrderLineItem.find(params[:order_line_item_id])
    else
      @line_item = OrderLineItem.find(params[:id])
    end
  end
end