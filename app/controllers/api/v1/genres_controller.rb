class Api::V1::GenresController < ApplicationController
  def index
    render json: ::Genre.all
  end

  def show
    # render json: current_genre.to_json
    # Explain as_json vs to_json
    render json: current_genre.to_json(include: :movies)
    #render json: current_genre.to_json(include: :movies, root: true)
    #render json: current_genre.to_json(include: :movies, root: :genre)
    #render json: current_genre.to_json(include: :movies, only: [:name, :id])
    #render json: current_genre.to_json(include: { movies: { only: [:title]} }, only: [:name, :id])
    #render json: current_genre.to_json(include: { movies: { only: [:title], include: :comments } }, only: [:name, :id])
  end
  
  private

  def current_genre
    ::Genre.find(params[:id])
  end
end
