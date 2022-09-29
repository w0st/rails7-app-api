module Api
  module V1
    class GenrePresenter
      def initialize(genre)
        @genre = genre
      end

      def basic # NOTE: The name is an effect of established convention in the project
        {
          name: genre.name,
          id: genre.id,
          number_of_movies: genre.movies.size,
          movies: genre.movies.as_json
        }

      end

      private

      attr_reader :genre
    end
  end
end
