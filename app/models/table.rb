class Table < ApplicationRecord
  has_many :orders, class_name: 'Order'
  validates :reference, :status, presence: true 

  scope :ordered_by_ref, -> { order(reference: :asc) }
  scope :available, -> { where(status: 'available') }

  STATUS = %w[available reserved blocked]
    
end
