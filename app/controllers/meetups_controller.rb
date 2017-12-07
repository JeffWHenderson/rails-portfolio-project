class MeetupsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @meetups = Meetup.all
  end

  def show
    @group = Group.find(params[:group_id])
    @meetup = Meetup.find(params[:id]) #this is wrong.. I only want to find the meetup that is specific for this group.. my links may take care of this (/groups/meetups/1 wouldn't exist because meetup 1 doesn't belong to the group..) but I also need to prevent users from typing url directly.
  end

  def new
  end

  def create
  end

  #needs authorizations
  def edit
  end

  def update
  end
  #how can I verify that only the creator of a meetup can delete it????
  # could i look at the First instance of a user_group and verify THAT was the creator?
  def destroy
  end
end
# group_meetups GET   /groups/:group_id/meetups(.:format)          meetups#index
#      POST           /groups/:group_id/meetups(.:format)          meetups#create
# new_group_meetup GET    /groups/:group_id/meetups/new(.:format)      meetups#new
# edit_group_meetup GET   /groups/:group_id/meetups/:id/edit(.:format) meetups#edit
# group_meetup GET     /groups/:group_id/meetups/:id(.:format)      meetups#show
#      PATCH         /groups/:group_id/meetups/:id(.:format)      meetups#update
#      PUT           /groups/:group_id/meetups/:id(.:format)      meetups#update
#      DELETE        /groups/:group_id/meetups/:id(.:format)      meetups#destroy
