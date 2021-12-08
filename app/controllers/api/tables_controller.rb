class Api::TablesController < ApplicationController
  respond_to :json
    
  def items
    order = Order.where(status: 'open', table_id: params[:table_id]).first
    if order
      response = {
        commands: order.commands.map do |command|
          {
            client_name: command.client_name,
            total: command.total,
            status: command.status,
            line_items: command.line_items
          }
        end
      }
      render json: response, status: :ok
    else
      head :not_found
    end
  end
end
