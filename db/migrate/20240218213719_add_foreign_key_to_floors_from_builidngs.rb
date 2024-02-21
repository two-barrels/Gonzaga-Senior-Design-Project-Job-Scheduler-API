class AddForeignKeyToFloorsFromBuilidngs < ActiveRecord::Migration[7.0]
  def change
    add_column :buildings, :name, :string
    add_foreign_key :floors, :buildings
  end
end
