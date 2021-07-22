# frozen_string_literal: true

class CreateMovieWorker

  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform(title)
    new_movie = ImportMovie.new(title)
    new_movie.call
  end

end
