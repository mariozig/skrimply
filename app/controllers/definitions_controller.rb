class DefinitionsController < ApplicationController

  def create
    @definition = Definition.new(params[:definition])
    @definition.submitting_user = current_user

    respond_to do |format|
      if @definition.save
        format.html { redirect_to track_path(@definition.track), notice: 'Definition created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { redirect_to track_path(@definition.track) }
        format.json { render json: @definition.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @track = Track.find(params[:track_id])
    @definitions = @track.definitions

    respond_to do |format|
      format.json { render json: @definitions }
    end
  end

  private
    def definition_params
      params.require(:definition).permit(:text, :track_id, :range_start, :range_end, :backward_selection)
    end

end