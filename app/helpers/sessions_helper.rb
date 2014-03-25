module SessionsHelper
  
  def sign_in(user, ip)
    remember_token = User.new_remember_token
    location = user_location(ip)
    cookies.permanent[:remember_token] = remember_token
    cookies.permanent[:location] = location.to_json
    user.update_attribute(:remember_token, User.hash(remember_token))
    user.location = location
    self.current_user = user
  end
  
  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def user_location(ip_address)
    return Geocoder.coordinates(ip_address)
  end
  
end
