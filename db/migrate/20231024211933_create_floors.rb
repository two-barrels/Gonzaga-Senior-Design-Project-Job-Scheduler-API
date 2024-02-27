# frozen_string_literal: true

class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.integer :floor_number
      t.string :floor_name
    end
  end
end
