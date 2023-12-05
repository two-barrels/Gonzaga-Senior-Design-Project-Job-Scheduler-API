# frozen_string_literal: true

class RemoveSpacesIdFromSpacesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :spaces, :spaces_id
  end
end
