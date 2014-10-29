class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_sign_in, :sign_in?, :sign_out_all_sessions

  #s -cu r s s

  def sign_in(user)
    sign_in = user.sign_ins.create!
    session[:token] = sign_in.session_token
  end

  def current_user
    return nil if !sign_in?
    current_sign_in.user
  end

  def current_sign_in
    return nil if !session[:token]
    SignIn.find_by_session_token(session[:token])
  end

  def sign_in?
    !!current_sign_in
  end

  def sign_out(sign_in)
    session_token = nil if sign_in == current_sign_in
    current_sign_in.destroy!
  end
 
  def required_sign_in
    redirect_to new_session_url unless sign_in?
  end

  def require_no_user
    redirect_to user_url(current_user) if sign_in?
  end
  
  def sign_out_all_sessions
    SignIn.where(user_id: current_user.id).destroy_all
    redirect_to new_sign_in_url
  end
end
