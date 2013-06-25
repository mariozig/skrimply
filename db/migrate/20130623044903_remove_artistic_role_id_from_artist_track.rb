class RemoveArtisticRoleIdFromArtistTrack < ActiveRecord::Migration
  def change
    remove_column :artist_tracks, :artistic_role_id, :integer
  end
end