class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.integer :release_kind_id
      t.integer :label_id
      t.string :release_date
      t.string :location

      t.timestamps
    end
  end
end
