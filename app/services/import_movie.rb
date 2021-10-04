# frozen_string_literal: true

class ImportMovie

  def initialize(title)
    @title = title
  end

  def call
    Movie.create!(movie_attributes)
  rescue Errors::MovieNotFoundError => e
    Rails.logger.warn(e.message)
  end

  private

  attr_reader :title

  def movie_attributes
    OmdbapiAdapter.find(title)
  end

end
