class LineItem < ApplicationRecord
  belongs_to :command
  belongs_to :product
  validates :status, presence: true

  scope :from_command, ->(command_id) { where(command_id: command_id) }

  enum status: %i[waiting preparing ready delivered]

  def total
    quantity * price
  end
end
