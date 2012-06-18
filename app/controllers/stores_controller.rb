class StoresController < ApplicationController
  respond_to :html, :json, :js

  def index
    set_location
    # @stores = Store.all
    @stores = Store.near(@location, @distance.to_i)
    @stores_map = @stores.to_gmaps4rails

    @center_map = Geocoder.search(@location).first.data["geometry"]["location"]
    respond_with @stores_map
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params[:store])
    if @store.save
      redirect_to stores_path, :notice => 'Successfully added a new store.'
    else
      flash[:error] = 'Please correct any validation errors.'
      render :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(params[:store])
      redirect_to stores_path, :notice => 'You have updated a store.'
    else
      flash[:error] = 'Please correct any validation errors.'
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy

    redirect_to stores_path, :notice => 'You have deleted a store.'
  end

  def set_location
    if params[:search].nil?
      geolocate_ip
      @location, @distance = @city, 20
    else
      @location, @distance = params[:search], params[:distance]
    end
  end

  def geolocate_ip
    if Rails.env == 'development'
      @city = 'San Diego, CA'
    else
      @city = request.location.city
    end
  end
end
