class UsersController < ApplicationController
  before_action :require_no_user, only: [:create, :new]
  # before_action :required_sign_in, only: [:edit, :index ,:show]
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id]);
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]);
    @user.destroy
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:password, :email,  :name);
  end
end
