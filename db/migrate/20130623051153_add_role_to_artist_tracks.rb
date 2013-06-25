class AddRoleToArtistTracks < ActiveRecord::Migration
  def change
    add_column :artist_tracks, :role, :string
  end
end
