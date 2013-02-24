class CreateReleaseKinds < ActiveRecord::Migration
  def change
    create_table :release_kinds do |t|
      t.string :kind

      t.timestamps
    end
  end
end
