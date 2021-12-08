class Api::TablesController < ApplicationController
  respond_to :json
    
  def items
    order = Order.where(status: 'open', table_id: params[:table_id]).first
    if order
      render json: order.line_items, status: :ok
    else
      head :not_found
    end
  end
end
