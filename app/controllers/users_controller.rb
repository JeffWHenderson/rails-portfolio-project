class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def show
    @ug = UserGroup.all.select do |ug|
      ug.user_id == 1 #session[:user]['id']
    end
  end
end
