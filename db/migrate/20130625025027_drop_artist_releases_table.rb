class DropArtistReleasesTable < ActiveRecord::Migration
  def change
    create_table :artist_releases, force: true do |t|
      t.integer  :artist_id
      t.integer  :release_id
      t.integer  :artistic_role_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :artist_releases, :artist_id
    add_index :artist_releases, :artistic_role_id
    add_index :artist_releases, :release_id
  end
end
