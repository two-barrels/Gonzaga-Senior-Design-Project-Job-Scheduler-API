class CreateSpaceGeometries < ActiveRecord::Migration[7.0]
  def change
    create_table :space_geometries do |t|

      t.timestamps
    end
  end
end
