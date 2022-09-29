json.id @genre.id
json.name @genre.name

json.movies @genre.movies, :id, :title, :release_date

# json.movies @genre.movies do |movie|
#   json.title movie.title
# end

# json.movies @genre.movies, partial: 'movie', as: :movie
