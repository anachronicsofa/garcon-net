class CommandsController < ApplicationController
  before_action :set_command, only: %i[show edit update destroy confirm_payment]

  def index
    @commands = Command.paginate(page: params[:page], per_page: 15)
  end

  def show; end

  def new
    @command = Command.new
  end

  def edit; end

  def confirm_payment
    @command.update(status: 'paid')
    respond_to do |format|
      format.js
    end
  end

  def create
    @command = Command.new(command_params)
    @command.open!

    respond_to do |format|
      if @command.save
        format.html { redirect_to order_path(@command.order_id), notice: 'Command was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @command.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @command.update(command_params)
        format.html { redirect_to @command, notice: 'Command was successfully updated.' }
        format.json { render :show, status: :ok, location: @command }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @command.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @command.destroy
    respond_to do |format|
      format.html { redirect_to commands_url, notice: 'Command was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_from_mobile
    opened_order = Order.where(table_id: params[:table_id], status: 'open')
    if opened_order.empty?
      order = Order.create(table_id: params[:table_id], status: 'open')
    else
      order = opened_order.last
    end
    command = Command.create(client_name: params[:client_name], status: 'open', order_id: order.id)
    params[:items].each { |item| command.line_items << LineItem.create(item.to_unsafe_hash) }

    render json: command, status: :created
  end

  private

  def set_command
    @command = Command.find(params[:id])
  end

  def command_params
    params.require(:command).permit(:status, :client_name, :client_cpf, :client_email, :total, :order_id, :status)
  end
end
