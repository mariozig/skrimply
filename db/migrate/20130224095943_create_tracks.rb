class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :duration
      t.text :lyrics

      t.timestamps
    end
  end
end
