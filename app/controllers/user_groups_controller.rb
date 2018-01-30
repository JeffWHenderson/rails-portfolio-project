class UserGroupsController < ApplicationController
  def comment
    @comment = UserGroup.create(user_group_params)
    render json: @comment, status: 201
  end

  private
  def user_group_params
    params.permit('group_id', "user_id", "comment")
  end
end
