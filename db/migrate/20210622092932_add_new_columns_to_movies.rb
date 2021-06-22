class AddNewColumnsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :year, :integer
    add_column :movies, :rated, :string
    add_column :movies, :released, :date
    add_column :movies, :genre, :string
  end
end
