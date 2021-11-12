class AddMovieToBookmark < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :movie, :string
  end
end
