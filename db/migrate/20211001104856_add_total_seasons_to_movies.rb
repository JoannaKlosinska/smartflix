class AddTotalSeasonsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :total_seasons, :string
  end
end
