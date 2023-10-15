class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.integer :spaces_id
      t.string :spaces_name
      t.integer :floor_id
      t.timestamps
    end
  end
end
