# frozen_string_literal: true

class AddPaymentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.belongs_to :order
      t.timestamps
    end
  end
end
