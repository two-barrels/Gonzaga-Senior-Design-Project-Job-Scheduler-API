# frozen_string_literal: true

class RemoveUpdatedAtAttFromSpaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :spaces, :updated_at
  end
end
