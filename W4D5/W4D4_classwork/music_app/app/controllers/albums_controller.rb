class AlbumsController < ApplicationController
    before_action :login_redirect

  def new
    @bands = Band.all
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: @band.id)
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      redirect_to new_band_album_url(@album.band)
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def edit
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    @band = @album.band
    render :edit
  end

  def update
    @album= Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    band = @album.band
    @album.destroy
    redirect_to band_url(band)
  end
  #
  # def edit
  #   @band = Band.find_by(id: params[:id])
  #   render :edit
  # end
  #
  # def update
  #   @band = Band.find_by(id: params[:id])
  #   if @band.update(band_params)
  #     redirect_to band_url(@band)
  #   else
  #     redirect_to edit_band_url
  #   end
  # end
  #
  # def index
  #   @bands = Band.all
  #   render :index
  # end
  #
  # def destroy
  #   @band = Band.find_by(id: params[:id])
  #   @band.destroy
  #   redirect_to bands_url
  # end

  private

  def album_params
    params.require(:album).permit(:title, :year, :album_type, :band_id)
  end
end
