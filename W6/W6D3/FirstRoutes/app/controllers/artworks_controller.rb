class ArtworksController < ApplicationController
  
  def index  
    user_id = params[:user_id]
    @artworks = Artwork.joins(:shared_viewers).where('artworks.artist_id = ? OR artwork_shares.viewer_id = ?', user_id, user_id)
    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      redirect_to artworks_url(@artwork)
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end
  
  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end
  
  def update
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork.update(artwork_params)
      redirect_to artwork_url(@artwork)
    else  
      render json: @artwork.errors.full_messages, status: 422
    end
  end 
  
  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork 
      @artwork.destroy 
      render json: @artwork
    else
      render json: { error: "artwork doesn't exist"}
    end
  end

  private
  def artwork_params
      params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end