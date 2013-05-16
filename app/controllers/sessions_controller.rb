class SessionsController < ApplicationController
	def new
	  if current_user.nil?
	    render "new"
    else
      redirect_to "/trips"
    end
	end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/trips", :notice => "Logged in!"
  	else
  		flash.now.alert = "Invalid username or password!"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out!"
  end
end
