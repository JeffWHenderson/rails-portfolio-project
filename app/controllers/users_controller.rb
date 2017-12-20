class UsersController < ApplicationController
  def show
    @user = User.new
    #  if session[:user]
    #     # @ug = UserGroup.all.select do |ug|
    #     #   ug.user_id == 1 #session[:user]['id']
    #     #end
    #  end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  #:email => params[:user][:email], :password => params[:user][:password]
end
