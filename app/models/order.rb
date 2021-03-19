class Order < ApplicationRecord
  has_many :commands
  belongs_to :table

  scope :from_table, -> (table_id){ where(table_id: table_id) }
  scope :paid, -> { where(status: 'paid') }

  validates :status, presence: true
  
  enum status: [:open, :paid]
  
end
