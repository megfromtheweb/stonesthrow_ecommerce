# frozen_string_literal: true

class ChangePurchasesToOrderLineItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :purchases, :order_line_items
  end
end
