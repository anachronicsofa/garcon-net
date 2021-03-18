class Order < ApplicationRecord
  has_many :commands
  belongs_to :table, class_name: "table", foreign_key: "table_id"

  scope :from_table, -> (table_id){ where(table_id: table_id) }
  scope :paid, -> { where(status: 'paid') }

  validates :status, presence :true, default: 'open'
  
  STATUS = %w[open paid]
end
