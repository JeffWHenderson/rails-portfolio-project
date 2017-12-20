class UserGroupsController < ApplicationController
  def comment
    #b = UserGroup.new(comment: comment, group_id: group_id, user_id: user_id)
    raise b.inspect
  end

  def create
    @group = Group.find(params[:group_id])
    @user = session[:user]
    @new_user_group = UserGroup.new(:user_id => session[:user]['id'], :group => @group)
    if @new_user_group.save
      flash[:notice] = "Successfully Joined Group"
      redirect_to root_path
    else
      flash[:notice] = "Couldn't Join Group"
      redirect_to root_path
    end
  end

  private

end
