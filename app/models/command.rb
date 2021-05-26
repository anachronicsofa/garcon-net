class Command < ApplicationRecord
  has_many :line_items
  belongs_to :order

  validates :total, :client_name, presence: true 

  enum status: [:open, :paid]
  
  scope :from_order, -> (order_id){ where(order_id: order_id) }  

  def total
    self.total = line_items.sum { |li| li.price * li.quantity } || 0
  end
end
