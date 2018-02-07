class MeetupsController < ApplicationController
  def day_select
      @display_day = params[:day]
      @day = Meetup.day_of_the_week(@display_day)
  end

  def index
    @group = Group.find(params[:group_id])
    @meetups = @group.meetups

    render json: @meetups
  end

  def show
    @meetup = Meetup.find(params[:id])
    render json: @meetup
  end

  def new
    @group = Group.find(params[:group_id])
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @group = @meetup.group
    if @meetup.save
      flash[:notice] = "save succuessful"
      redirect_to group_meetup_path(@group, @meetup)
    else
      flash[:notice] = "meetup creation was unsuccessful"
      render 'new'
    end
  end


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
      render "edit"
    end

  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy
    flash[:notice] = "Meetup deleted"
    redirect_to root_path
  end

  def all
    @meetups = Meetup.all
  end

  def after_3
    @meetups = Meetup.after_3

    render json: @meetups
  end

  private

  def meetup_params
    params.require(:meetup).permit(:name, :location, :day, :time, :group_id, :tag_ids => [], :tags_attributes => [:name])
  end

  def day_param
    params.permit(:day)
  end
end
# group_meetups GET       /groups/:group_id/meetups(.:format)           meetups#index
#      POST               /groups/:group_id/meetups(.:format)           meetups#create
# new_group_meetup GET    /groups/:group_id/meetups/new(.:format)       meetups#new
# edit_group_meetup GET   /groups/:group_id/meetups/:id/edit(.:format)  meetups#edit
# group_meetup GET      /groups/:group_id/meetups/:id(.:format)         meetups#show
#      PATCH            /groups/:group_id/meetups/:id(.:format)         meetups#update
#      PUT              /groups/:group_id/meetups/:id(.:format)         meetups#update
#      DELETE           /groups/:group_id/meetups/:id(.:format)         meetups#destroy
