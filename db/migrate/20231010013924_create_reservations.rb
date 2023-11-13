class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :reservation_id
      t.integer :space_id
      t.integer :account_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
