# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :payment
  has_many :purchases
  has_many :products, through: :purchases
end
