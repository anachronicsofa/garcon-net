module Order
  class CloseOrder
    attr_accessor :order
    
    def self.call(order)
      new(order).call
    end

    def initialize(order)
      @order = order
    end

    def call
      return unless order.already_paid?

      order.update(status: 'paid')
      order.table.available!
    end
  end
end
