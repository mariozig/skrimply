class CreateYoutubeVideos < ActiveRecord::Migration
  def change
    create_table :youtube_videos do |t|
      t.text :embed_html
      t.integer :track_id

      t.timestamps
    end
    add_index :youtube_videos, :track_id
  end
end
