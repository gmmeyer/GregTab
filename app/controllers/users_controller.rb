class UsersController < ApplicationController
  before_filter :require_signed_in, only: [:settings]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      flash[:notices] = ["Congradulations on signing up, and welcome to GregTab, #{@user.username}!"]
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

end
