class RemoveYearFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :year, :integer
  end
end
