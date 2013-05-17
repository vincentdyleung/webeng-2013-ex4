class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  
  def decide
    @trip = Trip.find(params[:id])
  end
  
  # GET /trips/all
  def all
    @trips = Trip.all
  end
  
  # GET /trips
  # GET /trips.json
  def index
    if current_user.nil?
      redirect_to root_url, :alert => "Please log in"
    else
      @trips_owned = current_user.trips_owned
      @trips_joined = current_user.trips_joined
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
    if current_user.nil?
      redirect_to root_url, :alert => "Please log in"
    end
    if !@trip.owner_id.eql?current_user.id
      redirect_to "/trips", :alert => "You cannot edit trips owned by other people"
    end
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.owner_id = current_user.id
    @trip.participants << current_user
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trip }
      else
        format.html { render action: 'new' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    params[:trip][:participant_ids] ||= []
    params[:trip][:poi_ids] ||= []
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    if current_user.nil?
      redirect_to root_url, :alert => "Please log in"
      return
    end
    if !@trip.owner_id.eql?current_user.id
      redirect_to "/trips", :alert => "You cannot delete trips owned by other people"
      return
    end
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:start_date, :end_date, :city, :participant_ids => [], :poi_ids => [])
    end
end
