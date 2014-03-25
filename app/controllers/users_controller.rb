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
  
  def get_nearby
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="
    lat = JSON.parse(cookies[:location])[0].to_s
    lng = JSON.parse(cookies[:location])[1].to_s
    full_url = url + lat + ',' + lng + '&sensor=false&key=AIzaSyAYXSIvkFkhm8PoPxiMc-W37fh0f2ZsRds&radius=500'
    @response = HTTParty.get(full_url)
    respond_to do |format|
      format.json { render json: @response }
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
  end
end
