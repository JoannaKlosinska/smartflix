# frozen_string_literal: true

class CreateFakeMovieWorker

  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform
    Movie.create(title: Faker::Movie.title, year: Faker::Number.between(from: 1950, to: 2021))
  end

end
