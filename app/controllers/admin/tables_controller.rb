class Admin::TablesController < ApplicationController
  before_action :set_table, only: %i[ show ]

  def index
    @tables = Table.ordered_by_ref.paginate(page: params[:page], per_page: 15)
  end

  def show
    @orders = Order.paid.where(table_id: @table.id)
    @open_order = Order.open.find_by(table_id: @table.id)
  end

  private
    def set_table
      @table = Table.find(params[:id])
    end

    def table_params
      params.require(:table).permit(:reference, :status)
    end
end

