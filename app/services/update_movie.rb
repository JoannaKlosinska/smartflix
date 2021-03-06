# frozen_string_literal: true

class UpdateMovie

  def initialize(movie)
    @movie = movie
  end

  def call
    if movie_up_to_date?
      movie.touch
    else
      movie.update!(movie_attributes)
    end
  end

  private

  attr_reader :movie

  EXCLUDED_ATTRIBUTES = %w[id updated_at created_at].freeze

  def movie_up_to_date?
    most_recent_movie.attributes.except(*EXCLUDED_ATTRIBUTES) == movie.attributes.except(*EXCLUDED_ATTRIBUTES)
  end

  def most_recent_movie
    Movie.new(movie_attributes)
  end

  def movie_attributes
    @movie_attributes ||= OmdbapiAdapter.find(movie.title)
  end

end
