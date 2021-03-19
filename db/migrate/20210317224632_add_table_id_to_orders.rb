class AddTableIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :table, null: false, foreign_key: true
    add_column :orders, :reference, :string    
  end
end
