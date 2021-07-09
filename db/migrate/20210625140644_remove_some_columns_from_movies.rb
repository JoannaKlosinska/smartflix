# frozen_string_literal: true

class RemoveSomeColumnsFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :rated, :string
    remove_column :movies, :released, :date
    remove_column :movies, :genre, :string
  end
end
