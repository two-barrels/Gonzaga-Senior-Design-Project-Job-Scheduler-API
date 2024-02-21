# frozen_string_literal: true

class CreateSpaceGeometries < ActiveRecord::Migration[7.0]
  def change
    create_table :space_geometries do |t|
      t.references :space, null: false, foreign_key: true
      t.geometry :shape
    end
  end
end
