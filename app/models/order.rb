class Order < ApplicationRecord
  has_many :commands
  belongs_to :table

  scope :from_table, -> (table_id){ where(table_id: table_id) }
  scope :open_from_table, -> (table_id) { find_by(status: 'open', table_id: table_id) }
  scope :paid, -> { paid? }

  validates :status, presence: true
  
  enum status: [:open, :paid]

  def to_pay 
    (total - already_paid) if total 
  end

  def already_paid
    commands.paid.count > 0 ? commands.paid.map { |c| c.total }.inject(:+) : 0.0
  end

  def total 
    commands.sum { |command| command.total }
  end
end
