# frozen_string_literal: true

class UpdateMovieWorker

  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform
    Movie.all.each do |movie|
      if movie.updated_at > 48.hours.ago
        movie.destroy
      else
        UpdateMovie.new(movie).call
      end
    end
  end

end
