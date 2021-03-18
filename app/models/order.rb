class Order < ApplicationRecord
  has_many :commands, class_name: 'Command'
  belongs_to :table, class_name: "Table", foreign_key: "table_id"

  scope :from_table, -> (table_id){ where(table_id: table_id) }
  scope :paid, -> { where(status: 'paid') }

  validates :status, presence: true
  
  STATUS = %w[open paid]
end
