# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :payment
  has_many :purchases
  has_many :products, through: :purchases

  enum(state: { created: 0, paid: 1 , picked: 2 , dispatched: 3 })

  scope :ordered, -> {where(state: %w[paid picked dispatched])}
end
