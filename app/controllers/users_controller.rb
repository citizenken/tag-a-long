class UsersController < ApplicationController
  def new
    @user = User.new 
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:error] = "You signed up successfully"
      redirect_to root_url
      #redirect_to user_path(@user)
    else
      flash[:error] = "Form is invalid"
      redirect_to root_url
      #render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
  end
end
