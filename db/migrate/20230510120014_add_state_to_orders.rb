class AddStateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :state, :integer, null: false, default: 0
  end
end
