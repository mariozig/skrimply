class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.submitting_user = current_user

    if @artist.save
      redirect_to @artist, notice: 'Artist created.'
    else
      render action: "new"
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: 'Artist updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_url
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :genre_ids)
    end
end
