class TracksController < ApplicationController
  before_action :set_track, only: [:edit, :update, :destroy]

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id], include: [ :definitions, :genres, :youtube_video ])
  end

  def new
    @track = Track.new
    @track.cuts.build(release_id: params[:release_id])
  end

  def edit
    @track.cuts.build if @track.cuts.empty?
  end

  def create
    @track = Track.new(track_params)
    @track.submitting_user = current_user

    if @track.save
      redirect_to @track, notice: 'Track created.'
    else
      render action: "new"
    end
  end

  def update
    if @track.update(track_params)
      redirect_to @track, notice: 'Track updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @track.destroy
    redirect_to tracks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:duration, :lyrics, :name, :genre_ids)
    end
end
