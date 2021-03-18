class LineItem < ApplicationRecord
  belongs_to :command, class_name: "Command", foreign_key: "command_id"
  validates :status, presence :true

  scope :from_command, -> (command_id){ where(command_id: command_id) }

  STATUS = %w[ waiting preparing ready delivered ]
  
end
