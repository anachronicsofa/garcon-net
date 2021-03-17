class Admin::TablesController < ApplicationController

  def index
    @tables = Table.paginate(page: params[:page], per_page: 5)
  end
end
