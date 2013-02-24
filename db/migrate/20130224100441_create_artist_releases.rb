class CreateArtistReleases < ActiveRecord::Migration
  def change
    create_table :artist_releases do |t|
      t.integer :artist_id
      t.integer :release_id
      t.integer :artistic_role_id

      t.timestamps
    end
  end
end
