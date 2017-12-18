Rails.application.routes.draw do

  resources :user_groups, only: [:create]

  resources :users, only: [:show]
  get '/sign_up', to: "users#new"
  post '/sign_up', to: "users#create"
  root 'users#index'

  get '/sign_in', to:  "sessions#new"
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/sign_in', to: "sessions#create"
  get '/sign_out', to: "sessions#destroy"

  get 'meetups', to: "meetups#all"

  resources :groups do
    resources :meetups
  end

end
# Prefix Verb   URI Pattern                                  Controller#Action
# user_groups POST        /user_groups(.:format)                       user_groups#create
#      user GET           /users/:id(.:format)                         users#show
#   sign_up GET           /sign_up(.:format)                           users#new
#           POST          /sign_up(.:format)                           users#create
#      root GET           /                                            users#index

#   sign_in GET           /sign_in(.:format)                           sessions#new
#           POST          /sign_in(.:format)                           sessions#create
#  sign_out GET           /sign_out(.:format)                          sessions#destroy

#    groups GET           /groups(.:format)                            groups#index
#           POST          /groups(.:format)                            groups#create
# new_group GET           /groups/new(.:format)                        groups#new
# edit_group GET          /groups/:id/edit(.:format)                   groups#edit
#     group GET           /groups/:id(.:format)                        groups#show
#           PATCH         /groups/:id(.:format)                        groups#update
#           PUT           /groups/:id(.:format)                        groups#update
#           DELETE        /groups/:id(.:format)                        groups#destroy

#   meetups GET           /meetups(.:format)                           meetups#all
# group_meetups GET       /groups/:group_id/meetups(.:format)          meetups#index
#           POST          /groups/:group_id/meetups(.:format)          meetups#create
# new_group_meetup GET    /groups/:group_id/meetups/new(.:format)      meetups#new
# edit_group_meetup GET   /groups/:group_id/meetups/:id/edit(.:format) meetups#edit
# group_meetup GET        /groups/:group_id/meetups/:id(.:format)      meetups#show
#           PATCH         /groups/:group_id/meetups/:id(.:format)      meetups#update
#           PUT           /groups/:group_id/meetups/:id(.:format)      meetups#update
#           DELETE        /groups/:group_id/meetups/:id(.:format)      meetups#destroy
