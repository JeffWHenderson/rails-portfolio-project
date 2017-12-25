class UserGroupsController < ApplicationController
  def comment
    p = user_group_params
    UserGroup.create(:comment => p["comment"], :user_id => p['user_id'], :group_id => p["group_id"])
    redirect_to group_path(p["group_id"])
  end

  private
  def user_group_params
    params.permit('group_id', "user_id", "comment")
  end
end
