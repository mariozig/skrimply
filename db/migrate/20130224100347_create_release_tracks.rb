class CreateReleaseTracks < ActiveRecord::Migration
  def change
    create_table :release_tracks do |t|
      t.integer :release_id
      t.integer :track_id
      t.integer :position
      t.integer :disc_number

      t.timestamps
    end
  end
end
