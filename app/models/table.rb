class Table < ApplicationRecord
  has_many :orders
  validates :reference, :status, presence: true 

  enum status: [:available, :reserved, :open]

  scope :ordered_by_ref, -> { order(reference: :asc) }
end
