# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :find_order, only: %i[show update checkout packed dispatched]
  before_action :find_line_item, only: :update

  def index
    return not_found unless current_user&.is_admin?

    if state.present?
      @title = "#{state} orders".titleize
      @orders = Order
                .where(state: state)
                .ordered
                .page(page_params)
                .per(40)
      @state = state
    else
      @title = "Orders"
      @orders = Order
                .ordered
                .page(page_params)
                .per(40)
    end
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
      @line_item.increase_quantity(quantity)
    else
      @order.order_line_items.create(product_id: product_id, quantity: quantity)
    end
    redirect_back(fallback_location: order_path(cart.id))
  end

  def checkout
    # @order.paid!
    # @order.update_total(0.75)
    # @order.order_line_items.each do |product|
    #   Product.find(product.product_id).decrease_quantity(product.quantity)
    # end
    # clear_cart
    # redirect_to payment_success_path(@order.id)
    @line_items = @order.order_line_items
    @postage_fee = 0.75
    @total = @order.subtotal + @postage_fee
    @intent = Stripe::PaymentIntent.create({
                                             amount: (@total * 100).to_i,
                                             currency: "gbp",
                                             automatic_payment_methods: {
                                               enabled: true
                                             }
                                           })
  end

  def packed
    return not_found unless current_user&.is_admin?

    @order.packed!
    redirect_back(fallback_location: order_path(@order.id))
  end

  def dispatched
    return not_found unless current_user&.is_admin?

    @order.dispatched!
    redirect_back(fallback_location: order_path(@order.id))
  end

  private

  def page_params
    params.permit(:page)[:page]
  end

  def state
    params.permit(:state)[:state]
  end

  def id
    params.permit(:id)[:id]
  end

  def order_id
    params.permit(:order_id)[:order_id]
  end

  def product_id
    params.permit(:product_id)[:product_id]
  end

  def quantity
    params.permit(:quantity)[:quantity]
  end

  def find_order
    @order = Order.find(order_id || id)
  end

  def find_line_item
    @line_item = @order.order_line_items.find_by(product_id: product_id)
  end
end
