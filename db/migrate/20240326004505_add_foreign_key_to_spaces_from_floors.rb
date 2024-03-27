class AddForeignKeyToSpacesFromFloors < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :spaces, :floors
  end
end
