# frozen_string_literal: true

class CreateMovie

  def initialize(title)
    @title = title
  end

  def call
    Movie.create!(title: movie_data['Title'], year: movie_data['Year'])
  end

  private

  attr_reader :title

  def movie_data
    @movie_data ||= Omdbapi.find(title)
  end

end
