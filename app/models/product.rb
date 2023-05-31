# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_line_items
  has_many :orders, through: :order_line_items

  enum(category: { uncategorised: 0, pebbles: 1, rocks: 2, boulders: 3 })
end
