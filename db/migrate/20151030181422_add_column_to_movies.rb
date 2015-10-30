class AddColumnToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :used, :boolean
  end
end
