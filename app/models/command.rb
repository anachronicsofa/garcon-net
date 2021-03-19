class Command < ApplicationRecord
  has_many :line_items
  belongs_to :order

  validates :total, :payment_status, :client_name, presence: true 

  enum status: [:open, :paid]
  
  scope :from_order, -> (order_id){ where(order_id: order_id) }  
end
