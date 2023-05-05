# frozen_string_literal: true

class PaymentsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    @order = Order.create(total: 2)
    payment = Payment.create(order_id: @order.id)
    purchase = Purchase.create(product_id: product.id, quantity: 1, order_id: @order.id)
    redirect_to payment_success_path(payment.id)
  end
  
  def success
    @payment = Payment.find(params[:payment_id])
  end
end
