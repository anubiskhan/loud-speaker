class OrdersController < ApplicationController
  def new
    @current_map = current_map
    @current_map.create_static
  end
end
