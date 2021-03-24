class AddTotalToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total, :float, default: 0.0
  end
end
