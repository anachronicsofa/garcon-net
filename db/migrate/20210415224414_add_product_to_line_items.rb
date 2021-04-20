class AddProductToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :line_items, :product, null: false, foreign_key: true
  end
end
