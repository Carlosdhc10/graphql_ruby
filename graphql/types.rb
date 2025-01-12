# archivo: graphql/types.rb
module Types
    class MovieType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :title, String, null: false
      field :year, Integer, null: false
      field :director, String, null: true
      field :genre, String, null: true
    end
  end
  