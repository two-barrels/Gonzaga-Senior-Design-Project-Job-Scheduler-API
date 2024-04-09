# frozen_string_literal: true

class AddTextToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :text, :string
  end
end
