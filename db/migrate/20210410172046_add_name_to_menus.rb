class AddNameToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :name, :string
  end
end
