class ArtistsController < ApplicationController
before_filter :authenticate_user!
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(params[:artist])

    if @artist.save
      redirect_to @artist, notice: 'Artist created.'
    else
      render action: "new"
    end
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update_attributes(params[:artist])
      redirect_to @artist, notice: 'Artist updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_url
  end
end
