class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :category, :integer, null: false, default: 0
  end
end
