class Api::V1::MapsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    session[:map] = map_params
    # @current_map = current_map
    # @current_map.assign_attributes(map_params)
    # @current_map.create_static
    render js: "window.location = '#{new_order_path}'"
  end

  def show

  end

  private

  def map_params
    params.permit(:lat, :lng, :zoom)
  end
end
