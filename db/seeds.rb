# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all

puts "Creating Movies..."

require 'json'
require 'open-uri'
url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_serialised = URI.open(url).read
movie = JSON.parse(movie_serialised)
movie['results'].each do |film|
  Movie.create(title: film['title'], overview: film['overview'], poster_url: "https://image.tmdb.org/t/p/original#{film['poster_path']}", rating: film['vote_average'])
end

puts "Finished creating movies"
