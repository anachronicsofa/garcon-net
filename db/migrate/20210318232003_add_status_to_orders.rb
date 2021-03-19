class AddStatusToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :integer
    add_column :tables, :status, :integer
    add_column :commands, :status, :integer
    add_column :line_items, :status, :integer
  end
end
