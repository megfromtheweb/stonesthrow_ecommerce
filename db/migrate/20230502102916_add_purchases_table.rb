# frozen_string_literal: true

class AddPurchasesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.belongs_to :product
      t.belongs_to :order
      t.integer :quantity
    end
  end
end
