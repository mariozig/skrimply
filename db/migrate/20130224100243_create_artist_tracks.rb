class CreateArtistTracks < ActiveRecord::Migration
  def change
    create_table :artist_tracks do |t|
      t.integer :artist_id
      t.integer :track_id
      t.integer :artistic_role_id

      t.timestamps
    end
  end
end
