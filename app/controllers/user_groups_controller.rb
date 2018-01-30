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



        # /// old comment code sans jquery
# p = user_group_params
# ug = UserGroup.new(:comment => p["comment"], :user_id => p['user_id'], :group_id => p["group_id"])
#
# if ug.save
#   redirect_to group_path(p["group_id"])
# else
#   flash[:notice] = "comments can't be blank"
#   redirect_to group_path(p["group_id"])
#           #render :js => "alert('comment can't  be blank');"
#           # @group = Group.find(p['group_id'])
#           # render template: "groups/show"
# end
