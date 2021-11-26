# frozen_string_literal: true

class DeleteMovies

  def initialize(movies)
    @movies = movies
  end

  def call
    movies.destroy_all
  end

  private

  attr_reader :movies
end
