# frozen_string_literal: true

class RemoveYearFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :year, :integer
  end
end
