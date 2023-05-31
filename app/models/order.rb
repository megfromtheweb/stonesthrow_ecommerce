# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :payment
  has_many :order_line_items
  has_many :products, through: :order_line_items

  enum(state: { created: 0, paid: 1, packed: 2, dispatched: 3 })

  scope :ordered, -> { where(state: %w[paid packed dispatched]) }

  def total_quantity
    order_line_items.map(&:quantity).sum
  end

  def subtotal
    order_line_items.map(&:subtotal).sum
  end

  def update_total(postage_fee)
    update(total: subtotal + postage_fee)
  end

  def editable?
    state == "created"
  end
end
