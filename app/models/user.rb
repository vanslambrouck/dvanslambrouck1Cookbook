class User < ActiveRecord::Base
  has_secure_password
  
  #==Authenticate Method
  # This static method is used to authenticate users.
  def self.authenticate(username, password)
    user = User.where(username: username).first
    user && user.authenticate(password)
  end
  
end
