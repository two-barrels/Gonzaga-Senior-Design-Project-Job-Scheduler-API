class AddBuildingFloorSpaceRole < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :type, :text
    add_column :roles, :associated_id, :integer
  end
end
