class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require "flickraw"
  FlickRaw.api_key = "b50cb361d7475defe8c39f323c03a869"
  FlickRaw.shared_secret = "e0f721be3df6d1ef"
  
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    if html_tag =~ /\<label/
      html_tag
    else
      errors = Array(instance.error_message).join(',')
      %(#{html_tag}<span class="validation-error">&nbsp;#{errors}</span>).html_safe
    end
  end
  
  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def twitter_client
    if !current_user.twitter_connected?
      @twitter_client ||= TwitterOAuth::Client.new(
        :consumer_key => "RD9thlilIyWKr4430B4iew",
        :consumer_secret => "WRMhZ19ndYhVQoB7KmMvlyq7k5XQmwwc70wjAeLnLcM"
      ) 
    else
      @twitter_client ||= TwitterOAuth::Client.new(
        :consumer_key => "RD9thlilIyWKr4430B4iew",
        :consumer_secret => "WRMhZ19ndYhVQoB7KmMvlyq7k5XQmwwc70wjAeLnLcM",
        :token => current_user.token,
        :secret => current_user.secret
      )
    end
  end
  
  def verify_user
    if current_user.nil?
      redirect_to root_url, :alert => "Please log in"
    end
  end
  
  helper_method :current_user, :twitter_client, :verify_user
end
