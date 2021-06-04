class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :close_order, only: %i[show]

  def index
    @orders = Order.paginate(page: params[:page], per_page: 15)
  end

  def show
    @command = Command.new
    @commands = Command.where(order: @order)
  end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        @order.update(reference: "ORDER-#{@order.id}")
        @order.table.open!
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

  def close_order
    Order::CloseOrder.call(@order)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit!
  end
end
