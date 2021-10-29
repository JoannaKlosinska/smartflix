# frozen_string_literal: true

class OmdbapiAdapter

  include HTTParty
  base_uri 'omdbapi.com'
  class << self

    def find(title)
      response = get('', { query: { apikey: Rails.application.credentials.omdb[:api_key], t: title } })

      raise Errors::MovieNotFoundError, title if response['Response'] == 'False'

      movie_attributes(response)
    end

    private

    EXCLUDED_ATTRIBUTES = :type

    def movie_attributes(response)
      response.transform_keys do |key|
        key.underscore.to_sym
      end.except(EXCLUDED_ATTRIBUTES)
    end

  end

end
