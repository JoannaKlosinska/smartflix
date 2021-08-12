# frozen_string_literal: true

class ImportMovie

  def initialize(title)
    @title = title
  end

  def call
    if movie_data['Response'] == 'True'
      Movie.create!(title: movie_data['Title'], year: movie_data['Year'])
    else
      print_error
    end
  end

  private

  attr_reader :title

  def movie_data
    @movie_data ||= OmdbapiAdapter.find(title.capitalize)
  end

  def print_error
    time = Time.zone.now
    Rails.logger.warn("#{movie_data['Error']} #{time.strftime('%k:%M')}, #{time.strftime('%d/%m/%Y')}")
  end

end
