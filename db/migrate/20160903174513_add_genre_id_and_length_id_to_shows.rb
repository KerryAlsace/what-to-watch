class AddGenreIdAndLengthIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :genre_id, :integer
    add_column :shows, :length_id, :integer
  end
end
