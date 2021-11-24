# frozen_string_literal: true

class MoviesController < ApplicationController

  def show
    title = params[:title]
    movie = Movie.find_by(title: title)

    if movie
      render json: movie
    else
      CreateMovieWorker.perform_async(title)
      render json: 'not found, try again later', status: :not_found
    end
  end

  def index
    @movies = Movie.all.paginate(page: params[:page])
  end

end
