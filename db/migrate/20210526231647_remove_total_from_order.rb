class RemoveTotalFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :total, :decimal
  end
end
