# frozen_string_literal: true

class ChangeOrderTotalToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :total, :decimal, precision: 10, scale: 2
  end
end
