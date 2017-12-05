# ///////////////////// devise documentations notes /////////////////////
  ##To set up a controller with user authentication, just add this before_action
  #before_action :authenticate_user!

# ///////////////////// relating to devise helpers /////////////////////
  # user_signed_in?
  # current_user
  # user_session
  # user_root_path will be used if it exists otherwise set up something like
          #root to: 'home#index'
  # You can also override after_sign_in_path_for and after_sign_out_path_for to customize your redirect hooks

# ///////////////////// relating to devise and strong params /////////////////////

  # There are just three actions in Devise that allow any set of parameters to be passed down to the model, therefore requiring sanitization. Their names and default permitted parameters are:
  #
  #   sign_in (Devise::SessionsController#create) - Permits only the authentication keys (like email)
  #   sign_up (Devise::RegistrationsController#create) - Permits authentication keys plus password and password_confirmation
  #   account_update (Devise::RegistrationsController#update) - Permits authentication keys plus password, password_confirmation and current_password

# ///////////////////// relating to devise and nested attributes /////////////////////

  # The above works for any additional fields where the parameters are simple scalar types. If you have nested attributes (say you're using accepts_nested_attributes_for), then you will need to tell devise about those nestings and types. Devise allows you to completely change Devise defaults or invoke custom behaviour by passing a block:
  #
  # To permit simple scalar values for username and email, use this
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in) do |user_params|
  #     user_params.permit(:username, :email)
  #   end
  # end

  # If you have some checkboxes that express the roles a user may take on registration, the browser will send those selected checkboxes as an array. An array is not one of Strong Parameters' permitted scalars, so we need to configure Devise in the following way:
  #
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #       user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
  #     end
  #   end

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
