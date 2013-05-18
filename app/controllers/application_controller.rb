class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  FlickRaw.api_key = "b50cb361d7475defe8c39f323c03a869"
  FlickRaw.shared_secret = "e0f721be3df6d1ef"
  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
