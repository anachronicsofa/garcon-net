class LineItem < ApplicationRecord
  belongs_to :command
  belongs_to :product

  scope :from_command, ->(command_id) { where(command_id: command_id) }

  enum status: %i[waiting preparing ready delivered]

  def total
    quantity * price
  end

  def populate 
    product = Product.find(product_id)    
    
    if product.prompt_delivery
      status = 'ready'      
    else 
      status = 'waiting'
    end
    
    self.update(price: product.price, status: status)   
  end
end
