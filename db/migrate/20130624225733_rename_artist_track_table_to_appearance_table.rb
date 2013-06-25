class RenameArtistTrackTableToAppearanceTable < ActiveRecord::Migration
  def change
    rename_table :artist_tracks, :appearances
  end
end
