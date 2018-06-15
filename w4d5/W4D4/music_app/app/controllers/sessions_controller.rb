class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    
    if user
      login!(user)
      user.save
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Incorrect email/password"]
      render :new
    end
  end
  
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
