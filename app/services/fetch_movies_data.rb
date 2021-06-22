# frozen_string_literal: true

class FetchMoviesData
  include HTTParty
  omdb_api_key = Rails.application.credentials.omdb[:api_key]
  base_uri "http://www.omdbapi.com/?apikey=#{omdb_api_key}"

  def initialize(title:)
    super()
    @title = title
  end

  def call
    self.class.get('&t', query: { t: title })
  end

  private

  attr_reader :title
end
