class CommandsController < ApplicationController
  before_action :set_command, only: %i[ show edit update destroy ]

  def index
    @commands = Command.paginate(page: params[:page], per_page: 15)
  end

  def show
  end

  def new
    @command = Command.new
  end

  def edit
  end

  def create
    @command = Command.new(command_params)

    respond_to do |format|
      if @command.save
        format.html { redirect_to order_path(@command.order_id), notice: "Command was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @command.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @command.update(command_params)
        format.html { redirect_to @command, notice: "Command was successfully updated." }
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
      format.html { redirect_to commands_url, notice: "Command was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_command
      @command = Command.find(params[:id])
    end

    def command_params
      params.require(:command).permit(:payment_status, :client_name, :client_cpf, :client_email, :total, :order_id)
    end
end
