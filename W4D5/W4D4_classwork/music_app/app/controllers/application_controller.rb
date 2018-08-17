class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?
  helper_method :login_redirect

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    return nil unless current_user
    true
  end

  def login_redirect
    redirect_to new_sessions_url unless logged_in?
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

end
