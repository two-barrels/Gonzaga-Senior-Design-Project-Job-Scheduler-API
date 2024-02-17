class AddSpacesPostgisTable < ActiveRecord::Migration[7.0]
  def change
    create_table :space_geometries do |t|
      t.references :space, null: false, foreign_key: true
      t.column :shape1, :geometry
      t.column :shape2, :geometry
      t.column :path, :geometry, srid: 3785
      t.column :lonlat, :geometry, geographic: true, limit: {:srid=>4326, :type=>"point"}
      t.column :lonlatheight, :geometry, geographic: true, limit: {:srid=>4326, :type=>"point", :has_z=>true}
    end
  end
end
