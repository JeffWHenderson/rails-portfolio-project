class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    if  @group.save
      redirect_to group_path(@group)
    else
      flash[:notice] = "group creation was unsuccessful"
      redirect_to root_path
    end
  end

  #needs authorizations
  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      flash[:notice] = "something went wrong"
      redirect_to edit_group_path(@group)
    end
  end

  #how can I verify that only the creator of a group can delete it????
  def destroy   #i need to make a current_user helper method.. I'm not getting it from devise???? actually Why not, gosh dard devise has been annoying
    @group = Group.find(params[:id]) #current_user.groups.find(params[:id])
    @group.destroy
    flash[:notice] = "Review deleted"
    redirect_to root_path #user_path(current_user)
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
# groups GET         /groups(.:format)                            groups#index
#      POST          /groups(.:format)                            groups#create
# new_group GET      /groups/new(.:format)                        groups#new
# edit_group GET     /groups/:id/edit(.:format)                   groups#edit
# group GET          /groups/:id(.:format)                        groups#show
#      PATCH         /groups/:id(.:format)                        groups#update
#      PUT           /groups/:id(.:format)                        groups#update
#      DELETE        /groups/:id(.:format)                        groups#destroy
