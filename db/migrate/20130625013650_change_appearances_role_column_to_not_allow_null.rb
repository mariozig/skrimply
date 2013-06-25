class ChangeAppearancesRoleColumnToNotAllowNull < ActiveRecord::Migration
  def change
    change_column :appearances, :role, :string, null: false
  end
end
