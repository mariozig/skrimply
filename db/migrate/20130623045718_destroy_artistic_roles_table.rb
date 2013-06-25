class DestroyArtisticRolesTable < ActiveRecord::Migration
  def change
    drop_table "artistic_roles", force: true do |t|
      t.string   "role"
      t.string   "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

end
