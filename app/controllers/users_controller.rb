class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show, :home]

  def new
    @user = User.new 
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:error] = "You signed up successfully"
      redirect_to user_path(@user)
    else
      flash[:error] = "Form is invalid"
      redirect_to root_url
    end
  end
  
  def home
    @user = User.find(current_user[:id])
    coords = [request.location.latitude, request.location.longitude] 
    @nearby_events = Event.near(coords, 5)

    # respond_to do |format|
    #   format.html
    #   format.json { render json: @nearby_events }
    # end
  end

  def show
    @user = User.find(params[:id])
    coords = [request.location.latitude, request.location.longitude] 
    @nearby_events = Event.near(coords, 5)
  end
    
  def check_email
    if User.where('email like ?', "#{checkemail_params}%").count == 0
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 409
    end
    return
  end  
  
  private
  
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
    
  def checkemail_params
    params.require(:email)
  end
  
  # Before filters
  
  def signed_in_user
    redirect_to root_url, notice: "Please sign in." unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
