# frozen_string_literal: true

require 'rest-client'
class FetchMoviesData
  def initialize(title:)
    @title = title
  end

  def fetch_movie
    api_key = Rails.application.credentials.omdb[:api_key]
    url = "http://www.omdbapi.com/?apikey=#{api_key}&t=#{title}"
    response = RestClient.get(url)
    movie_data = JSON.parse(response.body)
    return unless movie_data['Response'] == 'True'

    Movie.create(title: movie_data['Title'], year: movie_data['Year'])
  end

  private

  attr_reader :title
end
