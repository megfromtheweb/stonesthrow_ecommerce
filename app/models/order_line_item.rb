# frozen_string_literal: true

class OrderLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
end
