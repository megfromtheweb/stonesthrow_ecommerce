# frozen_string_literal: true

class OrderLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def subtotal
    quantity * product.price
  end

  def increase_quantity(increment)
    update(quantity: quantity + increment.to_i)
  end

  def decrease_quantity(decrement)
    update(quantity: quantity - decrement.to_i)
  end

  def set_quantity(quantity)
    update(quantity: quantity)
  end

  def destroy_if_zero
    return unless quantity < 1

    destroy
  end
end
