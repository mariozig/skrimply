class AddAttributesToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :range_start, :integer, :null => false
    add_column :definitions, :range_end, :integer, :null => false
    add_column :definitions, :left_to_right_selection, :boolean
  end
end
