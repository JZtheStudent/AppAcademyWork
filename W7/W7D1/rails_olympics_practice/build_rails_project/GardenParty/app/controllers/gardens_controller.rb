class GardensController < ApplicationController

  def index
    @gardens = Garden.all 
    render :index
  end
  
  def show
    @garden = Garden.find(params[:id])
    render :show
  end

  def create 
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to gardens_url
    else
      render :new
    end
  end

  private 
  def garden_params
    params.require(:garden).permit(:name, :size, :garden_owner_id)
  end

end