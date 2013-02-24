class CreateGenreTracks < ActiveRecord::Migration
  def change
    create_table :genre_tracks do |t|
      t.integer :track_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
