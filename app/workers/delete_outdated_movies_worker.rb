# frozen_string_literal: true

class DeleteOutdatedMoviesWorker

  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform(time)
    movies = FindOutdatedMovies.new(time).call
    movies.find_each do |batch|
      DeleteMovies.new(batch).call
    end
  end

end
