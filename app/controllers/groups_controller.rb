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
  end
  def update
  end
  #how can I verify that only the creator of a group can delete it????
  def destroy
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
