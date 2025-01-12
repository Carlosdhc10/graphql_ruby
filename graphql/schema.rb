# archivo: graphql/schema.rb
require './graphql/types'  # Asegúrate de que esta línea esté incluida

module Types
  class QueryType < GraphQL::Schema::Object
    field :movies, [MovieType], null: false do
      argument :genre, String, required: false
    end

    def movies(genre: nil)
      all_movies = [
        { id: 1, title: "Inception", year: 2010, director: "Christopher Nolan", genre: "Sci-Fi" },
        { id: 2, title: "The Matrix", year: 1999, director: "Wachowski Sisters", genre: "Sci-Fi" },
        { id: 3, title: "The Godfather", year: 1972, director: "Francis Ford Coppola", genre: "Crime" }
      ]
      genre ? all_movies.select { |movie| movie[:genre] == genre } : all_movies
    end
  end
end

class MovieAPI < GraphQL::Schema
  query(Types::QueryType)
end
