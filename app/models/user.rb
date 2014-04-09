class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :events
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  PASSWORD_REGEX = /\A[a-z,0-9]\z/i
  validates :firstname, :presence => true
  validates :lastname, :presence => true
   validates :email, :presence => true, :uniqueness => { case_sensitive: false }, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  has_secure_password
  validates_length_of :password, :minimum  => 6, :format => EMAIL_REGEX, :on => :create
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
     
  private
  
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
 
end
