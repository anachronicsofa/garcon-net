class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :available
      t.float :price
      t.string :description
      t.string :type
      t.boolean :prompt_delivery
      t.integer :stock
      t.time :preparation_time

      t.timestamps
    end
  end
end
