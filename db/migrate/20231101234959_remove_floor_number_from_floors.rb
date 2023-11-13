class RemoveFloorNumberFromFloors < ActiveRecord::Migration[7.0]
  def change
    remove_column :floors, :floor_number
  end
end
