class ManageTripController < ApplicationController
  def create
  end

  def index
    if current_user.nil?
      redirect_to root_url, :notice => "Please log in"
    else
      @my_trips = current_user.trips
    end
  end

  def show
  end

  def edit
  end
end
