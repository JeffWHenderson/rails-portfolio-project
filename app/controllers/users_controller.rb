class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def show
    if session[:user]
      redirect_to sign_in_path
    else
      @ug = UserGroup.all.select do |ug|
        ug.user_id == 1 #session[:user]['id']
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    #@user = User.new(user_params)
    if User.new(user_params).save
      raise @user.inspect
    else
      redirect_to sign_up_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  #:email => params[:user][:email], :password => params[:user][:password]
end
