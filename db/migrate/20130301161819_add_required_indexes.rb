class AddRequiredIndexes < ActiveRecord::Migration
  def change
    add_index :artist_genres, :artist_id
    add_index :artist_genres, :genre_id

    add_index :artist_releases, :artist_id
    add_index :artist_releases, :release_id
    add_index :artist_releases, :artistic_role_id

    add_index :artist_tracks, :artist_id
    add_index :artist_tracks, :track_id
    add_index :artist_tracks, :artistic_role_id

    add_index :artists, :user_id

    add_index :definitions, :track_id
    add_index :definitions, :user_id

    add_index :genre_releases, :release_id
    add_index :genre_releases, :genre_id

    add_index :genre_tracks, :track_id
    add_index :genre_tracks, :genre_id

    add_index :release_tracks, :track_id
    add_index :release_tracks, :release_id

    add_index :releases, :release_kind_id
    add_index :releases, :label_id
    add_index :releases, :user_id

    add_index :tracks, :user_id
  end
end
