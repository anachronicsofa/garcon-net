class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[show edit update destroy update_state]

  def index
    @line_items = LineItem.all
  end

  def show; end

  def new
    @line_item = LineItem.new
  end

  def edit; end

  def create
    @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        @line_item.populate
        format.html { redirect_to order_path(@line_item.command.order), notice: 'Line item was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_state
    @line_item.update(status: params[:state])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:quantity, :status, :command_id, :price, :product_id)
  end
end
