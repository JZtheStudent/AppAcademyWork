class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  def current_user 
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def require_logged_in
  
  end
  
  def require_logged_out
    redirect_to :root if logged_in?
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def login!(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end


end
