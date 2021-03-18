class Command < ApplicationRecord
  belongs_to :order, class_name: "order", foreign_key: "order_id"
  has_many :line_items
  validates :total, :payment_status, :client_name, presence: true 
  validates :total, default: 0.0
  validates :payment_status, default: 'open'

  scope :from_order, -> (order_id){ where(order_id: order_id) }  
end
