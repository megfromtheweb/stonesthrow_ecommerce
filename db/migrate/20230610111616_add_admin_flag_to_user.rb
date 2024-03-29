# frozen_string_literal: true

class AddAdminFlagToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, null: false, default: false
  end
end
