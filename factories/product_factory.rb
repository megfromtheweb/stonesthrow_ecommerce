# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'Test product for testing things' }
    sku { 'TT999' }
    price { 100 }
  end
end
