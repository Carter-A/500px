class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      session[:oauth_token] = request.env['omniauth.auth'].extra.access_token.token
      session[:consumer_key] = request.env['omniauth.auth'].extra.access_token.consumer.key
      session[:token_secret] = request.env['omniauth.auth'].extra.access_token.secret
      flash[:success] = "Welcome!"
    rescue RuntimeError => e
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
end
