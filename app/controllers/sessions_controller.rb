class SessionsController < ApplicationController
  def new
    if !current_user
      @user = User.new
    else
      redirect_to '/'
    end
  end

  def create #use strong params here
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      @user.save
      session[:user] = @user
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

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
