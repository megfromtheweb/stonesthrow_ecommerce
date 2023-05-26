# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :find_order, only: %i[show update checkout]
  before_action :find_line_item, only: :update

  def index
    @title = "Orders"
    @orders = Order.ordered
  end

  def show
    @title = if @order.state == "created"
               "Cart"
             else
               "Order ##{@order.id}"
             end
    @line_items = @order.order_line_items
    @postage_fee = 0.75
  end

  def new; end

  def update
    if @line_item
      @line_item.increase_quantity(params[:quantity])
    else
      @order.order_line_items.create(product_id: params[:product_id], quantity: params[:quantity])
    end
    redirect_back(fallback_location: order_path(cart.id))
  end

  def checkout
    @order.paid!
    @order.update_total(0.75)
    clear_cart
    redirect_to payment_success_path(@order.id)
  end

  private

  def order_params
    params.permit(:product_id, :quantity)
  end

  def find_order
    @order = Order.find(params[:order_id] || params[:id])
  end

  def find_line_item
    @line_item = @order.order_line_items.find_by(product_id: params[:product_id])
  end
end
