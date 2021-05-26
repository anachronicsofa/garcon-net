class Admin::DashboardController < ApplicationController
  def index
    @orders_number = Order.group_by_week(:created_at).count
    @money_per_week = Command.paid.group_by_week(:created_at).sum(:total)
  end
end

