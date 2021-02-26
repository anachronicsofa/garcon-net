class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.boolean :active

      t.timestamps
    end
  end
end
