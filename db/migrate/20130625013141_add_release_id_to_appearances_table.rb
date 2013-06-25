class AddReleaseIdToAppearancesTable < ActiveRecord::Migration
  def change
    add_column :appearances, :release_id, :integer
    add_index :appearances, :release_id
  end
end
