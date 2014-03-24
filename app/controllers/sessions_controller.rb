class SessionsController < ApplicationController
  def new
  end
  
  def create
    if User.exists?(username: user_params[:username_or_email])
      user = User.find_by(username: user_params[:username_or_email])
    elsif User.exists?(username: user_params[:username_or_email])
      user = User.find_by(email: user_params[:username_or_email])
    end

    if user && user.authenticate(user_params[:password])
      sign_in user, request.remote_ip
      redirect_to user
    elsif user
      flash.now[:error] = 'Invalid email/password combination'
      redirect_to root_url
    else
      flash.now[:error] = "No account found. Please re-enter your credentials or register a new account"
      redirect_to root_url
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
  private
  def user_params
    params.require(:session).permit(:username_or_email, :password)
  end
end
