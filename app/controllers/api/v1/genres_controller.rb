class Api::V1::GenresController < ApplicationController
  def index
    render json: ::Genre.all
  end
end
