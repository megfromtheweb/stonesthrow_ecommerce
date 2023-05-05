# frozen_string_literal: true

class AddOrdersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :total
      t.timestamps
    end
  end
end
