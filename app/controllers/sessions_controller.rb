class SessionsController < ApplicationController
  before_filter :require_signed_in!, only: [:destroy]
  before_filter :require_signed_out!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)
      flash[:notices] = ["Welcome to GregTab, #{@user.username}!"]
      redirect_to root_url
    else
      flash[:errors] = ["Invalid Username or Password."]
      @user = User.new
      render :new
    end
  end

  def destroy
    logout!
    flash[:notices] = ["Logged out sucessfully!"]
    redirect_to new_session_url
  end

end
