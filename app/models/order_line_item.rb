# frozen_string_literal: true

class OrderLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def update_quantity(quantity)
    return destroy if quantity == "0"

    increase_quantity(quantity)
  end

  def increase_quantity(increment)
    update(quantity: quantity + increment.to_i)
  end
end
