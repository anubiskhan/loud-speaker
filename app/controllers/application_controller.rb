class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_map

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def current_map
    @current_map ||= Map.find(session[:map]) if session[:map]
  end

end
