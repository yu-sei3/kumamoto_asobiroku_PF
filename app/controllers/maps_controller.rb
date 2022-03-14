class MapsController < ApplicationController

  def index
    @maps = Map.all
    @map = Map.new
  end

  def create
    map = Map.new(map_params)
    if map.save
      redirect_back(fallback_location: root_path)
    else
      render :index
    end
  end

  def destroy
    map = Map.find(params[:id])
    map.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def map_params
    params.require(:map).permit(:address, :latitube, :longitube)
  end

end
