class RemoveGenreAndLengthFromShows < ActiveRecord::Migration
  def change
    remove_column :shows, :genre
    remove_column :shows, :length
  end
end
