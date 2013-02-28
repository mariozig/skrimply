class ReleasesController < ApplicationController

  def index
    @releases = Release.all
  end

  def show
    @release = Release.find(params[:id])
  end

  def new
    @release = Release.new
  end

  def edit
    @release = Release.find(params[:id])
  end

  def create
    @release = Release.new(params[:release])
    @release.submitting_user = current_user

    if @release.save
      redirect_to @release, notice: 'Release created.'
    else
      render action: "new"
    end
  end

  def update
    @release = Release.find(params[:id])

    if @release.update_attributes(params[:release])
      redirect_to @release, notice: 'Release updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @release = Release.find(params[:id])
    @release.destroy

    redirect_to releases_url
  end
end
