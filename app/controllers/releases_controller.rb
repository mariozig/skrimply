class ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :edit, :update, :destroy]

  def index
    @releases = Release.all
  end

  def show
  end

  def new
    @release = Release.new
  end

  def edit
  end

  def create
    @release = Release.new(release_params)
    @release.submitting_user = current_user

    if @release.save
      redirect_to @release, notice: 'Release created.'
    else
      render action: "new"
    end
  end

  def update
    if @release.update_attributes(release_params)
      redirect_to @release, notice: 'Release updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @release.destroy
    redirect_to releases_url
  end

  private
    def set_release
      @release = Release.find(params[:id])
    end

    def release_params
      params.require(:release).permit(:label_id, :location, :name, :release_date, :release_kind_id, :owning_artist_ids)
    end
end
