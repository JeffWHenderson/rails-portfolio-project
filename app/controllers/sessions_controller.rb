class SessionsController < ApplicationController
  def new
    if session[:user]
      @user = User.new
    else
      redirect_to users_path
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user #&& @user.authenticate(params[:user][:password])
      redirect_to root_path
    else
      redirect_to sign_up_path
    end
  end

  def destroy
    session[:user].clear
    redirect_to root_path
  end

  private
end
