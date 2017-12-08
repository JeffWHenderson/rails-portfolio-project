Rails.application.routes.draw do

  resources :user_groups, only: [:create]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  root 'users#show'

  get 'meetups', to: "meetups#all"
  resources :groups do
    resources :meetups
  end
  #get '/', to: 'user/sessions#create'
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# root GET            /                                            users#index
# group_meetups GET   /groups/:group_id/meetups(.:format)          meetups#index
#      POST           /groups/:group_id/meetups(.:format)          meetups#create
# new_group_meetup GET    /groups/:group_id/meetups/new(.:format)      meetups#new
# edit_group_meetup GET   /groups/:group_id/meetups/:id/edit(.:format) meetups#edit
# group_meetup GET     /groups/:group_id/meetups/:id(.:format)      meetups#show
#      PATCH         /groups/:group_id/meetups/:id(.:format)      meetups#update
#      PUT           /groups/:group_id/meetups/:id(.:format)      meetups#update
#      DELETE        /groups/:group_id/meetups/:id(.:format)      meetups#destroy
# groups GET         /groups(.:format)                            groups#index
#      POST          /groups(.:format)                            groups#create
# new_group GET      /groups/new(.:format)                        groups#new
# edit_group GET     /groups/:id/edit(.:format)                   groups#edit
# group GET          /groups/:id(.:format)                        groups#show
#      PATCH         /groups/:id(.:format)                        groups#update
#      PUT           /groups/:id(.:format)                        groups#update
#      DELETE        /groups/:id(.:format)                        groups#destroy
