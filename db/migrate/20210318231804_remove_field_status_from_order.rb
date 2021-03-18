class RemoveFieldStatusFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :status, :string
    remove_column :tables, :status, :string
    remove_column :line_items, :status, :string
    remove_column :commands, :payment_status, :string
  end
end
