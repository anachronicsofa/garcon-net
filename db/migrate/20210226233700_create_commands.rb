class CreateCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :commands do |t|
      t.string :payment_status, default: 'open'
      t.string :client_name
      t.string :client_cpf
      t.string :client_email
      t.float :total, default: 0.00

      t.timestamps
    end
  end
end
