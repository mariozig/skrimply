class RemoveBackwardSelectionFromDefinitions < ActiveRecord::Migration
  def up
    remove_column :definitions, :backward_selection
  end

  def down
    add_column :definitions, :backward_selection, :boolean
  end
end
