# frozen_string_literal: true

class PaymentsController < ApplicationController
  def success
    Order.create(order_number:99999, total: 200)
  end
end
