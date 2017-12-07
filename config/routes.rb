Rails.application.routes.draw do

  #resources :user_groups
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  root 'users#index'

  resources :groups do
    resources :meetups
  end
  #get '/', to: 'user/sessions#create'
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
