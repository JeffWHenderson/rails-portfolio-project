class GroupsController < ApplicationController
  def index
    @groups = Group.all
    #respond_to do |f|                  #This is just an example where it can recieve json or html
      # f.html
      # f.json {render json: @groups}
    # end
  end

  def show
    @group = Group.find(params[:id])
    #render json: @group # this uses the serializer and makes json out of the group show
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
      render new_group_path
    end
  end

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
