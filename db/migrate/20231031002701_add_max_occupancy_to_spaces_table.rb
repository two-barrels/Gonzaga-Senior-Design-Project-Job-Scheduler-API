class AddMaxOccupancyToSpacesTable < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces,:max_occupancy, :integer
  end
end
