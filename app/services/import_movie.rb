# frozen_string_literal: true

class ImportMovie

  def initialize(title)
    @title = title
  end

  def call
    Movie.create!(title: movie_data['Title'], year: movie_data['Year'])
  end

  private

  attr_reader :title

  def movie_data
    @movie_data ||= OmdbapiAdapter.find(title)
  end

end
