class Admin::DashboardController < ApplicationController
  def index
    @orders_count = Order.group_by_week(:created_at).count
    @money_per_week = Command.paid.group_by_week(:created_at).sum(:total)
    @products = Product.joins(:line_items).group(:name).sum(:quantity)
    @commands_per_day = Command.paid.group_by_day(:created_at).count
  end
end

