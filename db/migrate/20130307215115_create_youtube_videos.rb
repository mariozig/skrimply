class CreateYoutubeVideos < ActiveRecord::Migration
  def change
    create_table :youtube_videos do |t|
      t.text :embed_code

      t.timestamps
    end
  end
end
