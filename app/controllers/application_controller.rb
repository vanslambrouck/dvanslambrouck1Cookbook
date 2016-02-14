class ApplicationController < ActionController::Base
  before_action :set_title
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :logged_in?
  helper_method :current_user
  
  private
    def set_title
      @title = "Cookbook"
    end
    
    def logged_in?
      session[:logged_in]
    end
    
    def authenticate
      if user = authenticate_with_http_basic {|user, password| User.authenticate(user, password)}
        session[:user_id] = user.id
        session[:logged_in] = true
      else
        request_http_basic_authentication
      end
    end
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
end
