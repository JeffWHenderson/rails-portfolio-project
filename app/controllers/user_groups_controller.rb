class UserGroupsController < ApplicationController
  def comment
    comment = params['comment'].inspect
    user_id = params['user_id']
    group_id = params['group_id']
    ug = UserGroup.new(:comment => comment, :user_id => user_id, :group_id => group_id)
    ug.save
    redirect_to group_path(group_id)
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
