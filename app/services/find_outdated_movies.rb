# frozen_string_literal: true

class FindOutdatedMovies

  def initialize(time)
    @time = time
  end

  def call
    Movie.where('updated_at < ?', Time.current - time)
  end

  private

  attr_reader :time

end
