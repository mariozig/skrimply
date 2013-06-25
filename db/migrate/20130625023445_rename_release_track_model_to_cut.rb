class RenameReleaseTrackModelToCut < ActiveRecord::Migration
  def change
    rename_table :release_tracks, :cuts
  end
end
