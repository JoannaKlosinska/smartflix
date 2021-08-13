# frozen_string_literal: true

class ImportMovie

  def initialize(title)
    @title = title
  end

  def call
    if movie_attributes[:response] == 'True'
      Movie.create!(movie_attributes)
    else
      print_error
    end
  end

  private

  attr_reader :title

  def movie_attributes
    movie_attributes = {}
    movie_data.each do |key, value|
      next if key == 'Type'

      movie_attributes[key.underscore.to_sym] = value
    end
    movie_attributes
  end

  def movie_data
    @movie_data ||= OmdbapiAdapter.find(title)
  end

  def print_error
    time = Time.zone.now
    Rails.logger.warn("#{title} not found! #{time.strftime('%k:%M')}, #{time.strftime('%d/%m/%Y')}")
  end

end
