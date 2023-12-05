# frozen_string_literal: true

namespace :db do
  desc 'Load test floors into the database'
  task populate_floors_table: :environment do
    # Define an array of test space data
    test_floor_1 = { floor_name: '1' }
    test_floor_2 = { floor_name: '2' }
    test_floor_3 = { floor_name: '3' }
    test_floor_4 = { floor_name: '4' }
    Floor.create(test_floor_1)
    Floor.create(test_floor_2)
    Floor.create(test_floor_3)
    Floor.create(test_floor_4)
    puts 'Test floors loaded successfully!'
  end
end
