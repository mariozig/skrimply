class GenresController < ApplicationController
  before_action :set_genre, only: [:show]

  def index
    @genres = Genre.order(:name)
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
