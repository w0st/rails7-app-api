class Api::V1::GenresController < ApplicationController
  def index
    render json: ::Genre.all
  end

  def show
    render json: ::Api::V1::GenrePresenter.new(current_genre).basic
  end
  
  private

  def current_genre
    ::Genre.find(params[:id])
  end
end
