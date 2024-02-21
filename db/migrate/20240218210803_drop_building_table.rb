class DropBuildingTable < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :floors, :building
    drop_table :building
  end
end
