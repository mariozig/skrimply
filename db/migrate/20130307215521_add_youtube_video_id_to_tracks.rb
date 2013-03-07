class AddYoutubeVideoIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :youtube_video_id, :integer
    add_index :tracks, :youtube_video_id
  end
end
