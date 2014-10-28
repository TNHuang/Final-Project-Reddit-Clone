class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :required_sign_in, :require_no_user,:sign_in?

  #s -cu r s s

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token]);
  end

  def sign_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:session_token] = user.reset_session_token
  end

  def sign_out
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def required_sign_in
    redirect_to new_session_url unless sign_in?
  end

  def require_no_user
    redirect_to user_url(current_user) if sign_in?
  end
end
