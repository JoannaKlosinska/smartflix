# frozen_string_literal: true

class CreateMovieWorker

  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform(title)
    new_movie = FetchMoviesData.new(title: title)
    new_movie.fetch_movie
  end

end
