class Api::TablesController < ApplicationController
  respond_to :json

  def items
    orders = Order.where(status: 'open', table_id: params[:table_id])
    if orders.any?
      response = {
        order: orders.map do |order|
          {
            commands: order.commands.map do |command|
              {
                client_name: command.client_name,
                command_id: command.id,
                total: command.total,
                status: command.status,
                line_items: command.line_items.map do |li| 
                  {
                    id: li.id,
                    quantity: li.quantity,
                    status: li.status,
                    price: li.price,
                    command_id: li.command_id,
                    product: li.product
                  }
                end
              }
            end
          }
        end
      }
      render json: response, status: :ok
    else
      head :not_found
    end
  end
end
