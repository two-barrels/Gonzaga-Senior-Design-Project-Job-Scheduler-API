namespace :db do
    desc "Load test reservation into the database"
    task populate_reservations_table: :environment do
      # Define an array of test reservation data
      test_reservation = { space_id: 2222, account_id: 3333, start_time: '2023-10-09 04:00:00', end_time: '2023-10-09 05:00:00' }
      test_reservation2 = { space_id: 2222, account_id: 3333, start_time: '2023-10-10 04:00:00', end_time: '2023-10-10 05:00:00' }
      
      Reservation.create(test_reservation)
      Reservation.create(test_reservation2)

      puts "Test reservation loaded successfully!"
    end
  end