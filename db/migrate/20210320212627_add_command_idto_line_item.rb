class AddCommandIdtoLineItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :commands_id
    add_reference :line_items, :command, null: false, foreign_key: true
  end
end
