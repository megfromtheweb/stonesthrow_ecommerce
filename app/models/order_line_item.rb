# frozen_string_literal: true

class OrderLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def increase_quantity(increment)
    update(quantity: quantity + increment.to_i)
  end

  def decrease_quantity(decrement)
    update(quantity: quantity - decrement.to_i)
    if self.quantity < 1
      self.destroy
    end
  end
end
