class SignInsController < ApplicationController
  before_action :require_no_user, only: [:create, :new]
  before_action :required_sign_in, only: :destroy

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
            params[:user][:name],
            params[:user][:password])     
    if @user
      sign_in(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = "Invalid username or password"
      render :new
    end            

  end

  def destroy
    sign_out(SignIn.find(params[:id]))
    redirect_to :back
  end


end
