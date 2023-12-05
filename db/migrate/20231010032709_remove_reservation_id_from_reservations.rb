# frozen_string_literal: true

class RemoveReservationIdFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :reservation_id
  end
end
