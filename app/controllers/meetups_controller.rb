class MeetupsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @meetups = @group.meetups
  end

  def show
    @group = Group.find(params[:group_id])
    @meetup = Meetup.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @meetup = Meetup.new#find(params[:id])
    # @meetup.tags.build
  end

  def create
    #raise params.inspect
    @group = Group.find(params[:group_id])
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
      flash[:notice] = "save succuessful"
      redirect_to group_meetup_path(@group, @meetup)
    else
      flash[:notice] = "meetup creation was unsuccessful"
      #render new_group_meetup_url
      render 'new'
    end
  end

  #needs authorizations
  def edit
    @group = Group.find(params[:group_id])
    @meetup = @group.meetups.find(params[:id])
  end

  def update
    @meetup = Meetup.find(params[:id])
    @group = Group.find(params[:group_id])
    if @meetup.update(meetup_params)
      flash[:notice] = "Meeting has been updated"
      redirect_to group_meetup_path(@group, @meetup)
    else
      flash[:notice] = "something is wrong yo"
      redirect_to root_path
    end

  end
  #how can I verify that only the creator of a meetup can delete it????
  # could i look at the First instance of a user_group and verify THAT was the creator?
  def destroy
    @meetup = Meetup.find(params[:id]) #current_user.groups.find(params[:id])
    @meetup.destroy
    flash[:notice] = "Meetup deleted"
    redirect_to root_path #user_path(current_user)
  end

  def all
    @meetups = Meetup.all
  end

  private

  def meetup_params
    params.require(:meetup).permit(:name, :location, :day, :time, :group_id, :tag_ids => [], :tags_attributes => [:name])
  end
  #<input type="text" name="tags_attributes[0][name]" id="meetup_tags_attributes_0_name">
end
# group_meetups GET       /groups/:group_id/meetups(.:format)           meetups#index
#      POST               /groups/:group_id/meetups(.:format)           meetups#create
# new_group_meetup GET    /groups/:group_id/meetups/new(.:format)       meetups#new
# edit_group_meetup GET   /groups/:group_id/meetups/:id/edit(.:format)  meetups#edit
# group_meetup GET      /groups/:group_id/meetups/:id(.:format)         meetups#show
#      PATCH            /groups/:group_id/meetups/:id(.:format)         meetups#update
#      PUT              /groups/:group_id/meetups/:id(.:format)         meetups#update
#      DELETE           /groups/:group_id/meetups/:id(.:format)         meetups#destroy
