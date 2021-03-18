class Command < ApplicationRecord
  belongs_to :order, class_name: "Order", foreign_key: "order_id"
  has_many :line_items, class_name: 'LineItem'

  validates :total, :payment_status, :client_name, presence: true 

  scope :from_order, -> (order_id){ where(order_id: order_id) }  
end
