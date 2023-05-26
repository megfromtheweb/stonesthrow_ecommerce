# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { "Test product for testing things" }
    sku { "TT999" }
    price { 1.00 }
  end
end
