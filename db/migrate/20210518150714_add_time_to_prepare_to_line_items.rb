class AddTimeToPrepareToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :time_to_prepare, :integer
  end
end
