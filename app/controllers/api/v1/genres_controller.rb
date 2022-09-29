class Api::V1::GenresController < ApplicationController
  def index
    render json: ::Genre.all, each_serialize: ::GenreSerializer
  end

  def show
    #render json: ::GenreSerializer.new(current_genre).to_json
    render json: current_genre, serializer: ::GenreSerializer
  end
  
  private

  def current_genre
    ::Genre.find(params[:id])
  end
end
