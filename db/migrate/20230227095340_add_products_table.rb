class AddProductsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku

      t.timestamps
    end
  end
end
