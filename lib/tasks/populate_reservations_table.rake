namespace :db do
    desc "Load test reservation into the database"
    task populate_reservations_table: :environment do
      # Define an array of test reservation data
      test_reservation = { space_id: 246, account_id: 123, start_time: '2023-11-06 10:00:00', end_time: '2023-11-06 11:00:00' }
      test_reservation2 = { space_id: 246, account_id: 456, start_time: '2023-11-06 14:00:00', end_time: '2023-11-06 15:30:00' }
      test_reservation3 = { space_id: 246, account_id: 456, start_time: '2023-11-07 12:00:00', end_time: '2023-11-07 13:00:00' }
      test_reservation4 = { space_id: 246, account_id: 789, start_time: '2023-11-09 09:00:00', end_time: '2023-11-09 10:00:00' }
      test_reservation5 = { space_id: 246, account_id: 123, start_time: '2023-11-09 12:00:00', end_time: '2023-11-09 14:00:00' }
      test_reservation6 = { space_id: 246, account_id: 101, start_time: '2023-11-10 15:00:00', end_time: '2023-11-10 16:00:00' }

      Reservation.create(test_reservation)
      Reservation.create(test_reservation2)
      Reservation.create(test_reservation3)
      Reservation.create(test_reservation4)
      Reservation.create(test_reservation5)
      Reservation.create(test_reservation6)

      puts "Test reservation loaded successfully!"
    end
  end