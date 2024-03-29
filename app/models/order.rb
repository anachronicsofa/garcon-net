class Order < ApplicationRecord
  has_many :commands
  has_many :line_items, through: :commands
  belongs_to :table

  scope :from_table, -> (table_id){ where(table_id: table_id) }
  scope :open_from_table, -> (table_id) { find_by(status: 'open', table_id: table_id) }
  scope :paid, -> { paid? }

  validates :status, presence: true
  
  enum status: [:open, :paid]

  def to_pay 
    (total - paid_total) if total 
  end

  def paid_total
    commands.paid.sum { |c| c.total } 
  end

  def total
    commands.sum { |c| c.total }
  end

  def already_paid?
    total != 0 && paid_total == total
  end
end
