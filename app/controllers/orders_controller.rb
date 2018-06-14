class OrdersController < ApplicationController
  def new
    @current_map.create_static
    
  end
end
