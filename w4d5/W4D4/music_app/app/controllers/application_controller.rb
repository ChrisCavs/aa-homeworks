class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user

    User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def require_login
    unless current_user
      flash[:error] = ["Must be logged in"]
      redirect_to new_session_url
    end 
  end
end
