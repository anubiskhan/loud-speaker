class SessionsController < ApplicationController
  def create
    user = User.update_or_create(request.env['omniauth.auth'])
    session[:id] = user.id
    redirect_to '/'
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
