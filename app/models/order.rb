# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :payment
  has_many :order_line_items
  has_many :products, through: :order_line_items

  enum(state: { created: 0, paid: 1, picked: 2, dispatched: 3 })

  scope :ordered, -> { where(state: %w[paid picked dispatched]) }

  def get_total_quantity
    order_line_items.map(&:quantity).sum
  end
end
