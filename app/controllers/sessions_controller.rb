class SessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
            params[:user][:name],
            params[:user][:password])
    if @user
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Invalid username or password"
      @user = User.new
      render :new
    end

  end

  def destroy
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
