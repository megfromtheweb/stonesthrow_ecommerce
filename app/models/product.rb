# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :purchases
  has_many :orders, through: :purchases
end
