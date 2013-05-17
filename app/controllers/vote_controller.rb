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
    @pois = @trip.pois
  end
  
end
