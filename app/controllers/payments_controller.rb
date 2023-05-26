# frozen_string_literal: true

class PaymentsController < ApplicationController
  def create; end

  def success
    @order = Order.find(params[:payment_id])
  end
end
