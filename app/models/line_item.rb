class LineItem < ApplicationRecord
  belongs_to :command
  belongs_to :product
  before_save :update_time

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

    product.update(stock: product.stock - quantity) if product.stock
    self.update(price: product.price, status: status)   
  end

  def update_time
    if status_changed?(to: 'ready') && !new_record?
      time_to_prepape = ((DateTime.current - created_at.to_datetime) * 24 * 60).to_i
      self.time_to_prepare = time_to_prepape
    end
  end
end
