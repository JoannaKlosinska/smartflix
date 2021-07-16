# frozen_string_literal: true

class Omdbapi

  include HTTParty
  base_uri 'omdbapi.com'
  class << self

    def find(title)
      get('', { query: { apikey: Rails.application.credentials.omdb[:api_key], t: title } })
    end

  end

end
