class ChangeDataTypeForDefinitionsText < ActiveRecord::Migration
  def up
    change_column(:definitions, :text, :text)
  end

  def down
    change_column(:definitions, :text, :string)
  end
end
