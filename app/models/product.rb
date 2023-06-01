# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_line_items
  has_many :orders, through: :order_line_items

  enum(category: { uncategorised: 0, pebbles: 1, rocks: 2, boulders: 3 })

  scope :in_stock, -> { where("quantity > 0") }

  validates :name, presence: { message: "can't be blank" },
                   uniqueness: true,
                   length: { maximum: 128 }

  validates :sku, presence: { message: "can't be blank"},
                  uniqueness: true,
                  length: { maximum: 128 }
  
  validates :price, presence: { message: "can't be blank"},
                    numericality: { greater_than: 0 }

  validates :quantity, presence: { message: "can't be blank"},
                       numericality: { greater_than_or_equal_to: 0 }


  def decrease_quantity(decrement)
    update(quantity: quantity - decrement.to_i)
  end
end
