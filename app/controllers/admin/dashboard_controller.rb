class Admin::DashboardController < ApplicationController
  def index
    @orders_number = Order.all.count
  end
end

