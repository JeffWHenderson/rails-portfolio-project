class SessionsController < ApplicationController
  def new
    if current_user.empty?
      @user = User.new
    else
      #this is showing on the signup path for some reason????
      #flash[:notice] = "Sign in failed, would you like to sign up??"
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

  def facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.uid = auth['uid']
      u.password = 'Temporary'
      u.email = auth['info']['email']
      #u.image = auth['info']['image']
    end

    session[:user] = @user

    redirect_to root_path
  end

  def destroy
    session[:user].clear
    redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
