class CreateGenreReleases < ActiveRecord::Migration
  def change
    create_table :genre_releases do |t|
      t.integer :release_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
