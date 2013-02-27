class RenameReleaseKindsKindColumnToName < ActiveRecord::Migration
  def change
    rename_column :release_kinds, :kind, :name
  end
end
