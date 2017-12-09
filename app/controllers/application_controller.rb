class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user]  # Use find_by_id to get nil instead of an error if user doesn't exist
  end

  def logged_in?
    !current_user.empty?
  end
  helper_method :current_user, logged_in? #make this method available in views
end
