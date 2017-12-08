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
  end

  def create
  end
end
