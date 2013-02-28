class AddUserIdToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :user_id, :integer
  end
end
