class SessionController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @auth = (Authorization.find_from_hash(auth) or Authorization.create_from_hash(auth, current_user))

    self.current_user = @auth.user

    render :text => "Welcome, #{current_user.name}."
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/auth/open_id'
  end
end
