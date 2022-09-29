# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

science_fiction = Genre.create!(name: 'Science fiction')
fantasy = Genre.create!(name: 'Fantasy')

movies = Movie.create!(
  [
    { title: "Matrix", genre: science_fiction, release_date: Date.new(1999) },
    { title: "Star Wars", genre: science_fiction, release_date: Date.new(1979) },
    { title: "Lord of the Rings", genre: fantasy, release_date: Date.new(2002) }
  ]
)

comments = Comment.create!(content: 'Absolutely brilliant!', movie: movies.first)
