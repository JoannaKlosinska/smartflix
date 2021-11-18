# frozen_string_literal: true

require 'sidekiq-scheduler'

class UpdateOneMovieWorker

  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform(movie_id)
    movie = Movie.find(movie_id)
    UpdateMovie.new(movie).call
  end

end
