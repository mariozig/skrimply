class CreateArtisticRoles < ActiveRecord::Migration
  def change
    create_table :artistic_roles do |t|
      t.string :role
      t.string :description

      t.timestamps
    end
  end
end
