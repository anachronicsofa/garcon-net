class LineItem < ApplicationRecord
  belongs_to :command
  validates :status, presence :true, default: 'waiting'

  scope :from_command, -> (command_id){ where(command_id: command_id) }

  STATUS = %w[ waiting preparing ready delivered ]
  
end
