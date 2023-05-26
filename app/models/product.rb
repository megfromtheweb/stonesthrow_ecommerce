# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_line_items
  has_many :orders, through: :order_line_items

  enum(category: { uncategorised: 0, pebble: 1, rock: 2, boulder: 3 })

  scope :pebbles, -> { where(category: "pebble") }
  scope :rocks, -> { where(category: "rock") }
  scope :boulders, -> { where(category: "boulder") }

end
