class VoteController < ApplicationController
  
  def add
    poi = Poi.find(params[:id])
    if !poi.nil?
      current_user.pois << poi
      render :text => "success"
    else
      render :text => "failure"
    end
  end
  
  def remove
    poi = Poi.find(params[:id])
    if !poi.nil?
      current_user.pois.delete poi
      render :text => "success"
    else
      render :text => "failure"
    end
  end
  
  def show
    @trip = Trip.find(params[:trip_id])
    if !@trip.participants.include?current_user
      redirect_to root_url, :alert => "Only participants can vote"
    end
    @pois = @trip.pois
  end
  
end
