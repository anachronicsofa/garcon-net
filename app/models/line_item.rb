class LineItem < ApplicationRecord
  belongs_to :command
  
  validates :status, presence :true

  scope :from_command, -> (command_id){ where(command_id: command_id) }

  enum status: [:wainting, :preparing, :ready, :delivered]
  
end
