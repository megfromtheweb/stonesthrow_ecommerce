# frozen_string_literal: true

class OrderLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def increase_quantity(increment)
    update(quantity: quantity + increment.to_i)
  end

  def decrease_quantity(decrement)
    update(quantity: quantity - decrement.to_i)
  end

  def destroy_if_zero
    if quantity < 1
      destroy
    end
  end
end
