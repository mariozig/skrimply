class CreateArtistGenres < ActiveRecord::Migration
  def change
    create_table :artist_genres do |t|
      t.integer :artist_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
