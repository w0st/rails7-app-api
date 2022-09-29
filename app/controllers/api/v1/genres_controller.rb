class Api::V1::GenresController < ApplicationController
  def index
    render json: ::Genre.all
  end

  def show
    @genre = current_genre
  end
  
  private

  def current_genre
    ::Genre.find(params[:id])
  end
end
