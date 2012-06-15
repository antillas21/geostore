class StoresController < ApplicationController

  def index
    @stores = Store.all
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
end
