class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Putting here to avoid bringing in Devise users_controller for just one helper method.
  def current_cart
    current_user.current_cart
  end
  helper_method :current_cart

end
