class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
    @definition = @track.definitions.build
  end

  def new
    @track = Track.new
    @track.release_tracks.build(:release_id => params[:release_id])
  end

  def edit
    @track = Track.find(params[:id])
    @track.release_tracks.build if @track.release_tracks.empty?
  end

  def create
    @track = Track.new(params[:track])
    @track.submitting_user = current_user

    if @track.save
      redirect_to @track, notice: 'Track created.'
    else
      render action: "new"
    end
  end

  def update
    @track = Track.find(params[:id])

    if @track.update_attributes(params[:track])
      redirect_to @track, notice: 'Track updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    redirect_to tracks_url
  end
end
