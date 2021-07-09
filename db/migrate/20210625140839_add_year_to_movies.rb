# frozen_string_literal: true

class AddYearToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :year, :integer
  end
end
