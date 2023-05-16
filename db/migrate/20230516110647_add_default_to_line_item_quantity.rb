# frozen_string_literal: true

class AddDefaultToLineItemQuantity < ActiveRecord::Migration[7.0]
  def change
    change_column_default :order_line_items, :quantity, from: nil, to: 0
  end
end
