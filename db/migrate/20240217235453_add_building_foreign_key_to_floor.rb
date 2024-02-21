class AddBuildingForeignKeyToFloor < ActiveRecord::Migration[7.0]
  def change
    add_column :floors, :building_id, :integer
    add_foreign_key :floors, :building
  end
end
