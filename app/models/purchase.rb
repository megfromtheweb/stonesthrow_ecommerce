# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :order
end
