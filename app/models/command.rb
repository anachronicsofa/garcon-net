class Command < ApplicationRecord
  has_many :line_items
  belongs_to :order

  validates :total, :client_name, presence: true 

  enum status: [:open, :paid]
  
  scope :from_order, -> (order_id){ where(order_id: order_id) }  

  def total
    line_items.count > 0  ? line_items.map { |li| (li.price*li.quantity) }.inject(:+) : 0.0
  end
end
