# frozen_string_literal: true

class RemoveCreatedAtAttFromSpaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :spaces, :created_at
  end
end
