class DefinitionsController < ApplicationController
  def create
    @definition = Definition.new(params[:definition])
    @definition.submitting_user = current_user

    if @definition.save!
      redirect_to track_path(@definition.track), notice: 'Definition created.'
    end
  end
end