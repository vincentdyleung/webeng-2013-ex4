class PoisController < ApplicationController
  before_action :set_poi, only: [:show, :edit, :update, :destroy]
  
  def mark
    @poi = Poi.find(params[:id])
    if !@poi.nil?
      @poi.definitive = true
      if @poi.save
        render :text => "success"
        return
      end
    end
    render :text => "failure"
  end
  
  def unmark
    @poi = Poi.find(params[:id])
    if !@poi.nil?
      @poi.definitive = false
      if @poi.save
        render :text => "success"
        return
      end
    end
    render :text => "failure"
  end
  
  def image
    @poi = Poi.find(params[:id])
  end
  
  def search_image
    @poi = Poi.find(params[:id])
    # search for 5 photos
    photos = flickr.photos.search(:text => params[:keyword], :per_page => 5)
    @thumbnail_urls = []
    photos.each do |photo|
      @thumbnail_urls << FlickRaw.url_q(flickr.photos.getInfo :photo_id => photo.id, :secret => photo.secret)
    end
    render "image"
  end
  
  # GET /pois
  # GET /pois.json
  def index
    @pois = Poi.all
  end

  # GET /pois/1
  # GET /pois/1.json
  def show
  end

  # GET /pois/new
  def new
    @poi = Poi.new
  end

  # GET /pois/1/edit
  def edit
  end

  # POST /pois
  # POST /pois.json
  def create
    @poi = Poi.new(poi_params)

    respond_to do |format|
      if @poi.save
        format.html { redirect_to @poi, notice: 'Poi was successfully created.' }
        format.json { render action: 'show', status: :created, location: @poi }
      else
        format.html { render action: 'new' }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pois/1
  # PATCH/PUT /pois/1.json
  def update
    respond_to do |format|
      if @poi.update(poi_params)
        format.html { redirect_to @poi, notice: 'Poi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pois/1
  # DELETE /pois/1.json
  def destroy
    @poi.destroy
    respond_to do |format|
      format.html { redirect_to pois_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poi
      @poi = Poi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poi_params
      params.require(:poi).permit(:name, :location, :description, :vote, :image_url)
    end
end
