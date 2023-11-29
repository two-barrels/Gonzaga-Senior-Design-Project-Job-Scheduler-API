class ChangeFlooridNameFromSpacesTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :spaces, :floor_id, :floor_name
  end
end
