class AddOrderIdToCommands < ActiveRecord::Migration[6.0]
  def change
    add_reference :commands, :order, null: false, foreign_key: true
  end
end
