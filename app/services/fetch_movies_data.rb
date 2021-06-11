# frozen_string_literal: true

require 'rest-client'

class FetchMoviesData
  def add_movies_by_title(title)
    api_key = Rails.application.credentials.omdbapi[:key]
    url = "http://www.omdbapi.com/?apikey=#{api_key}&t=#{title}"

    response = RestClient.get(url)
    movie_data = JSON.parse(response.body)
    Movie.create(title: movie_data['Title']) if movie_data['Response'] == 'True'
  end
end
