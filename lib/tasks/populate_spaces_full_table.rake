# frozen_string_literal: true

namespace :db do
  desc 'Load test space into the database'
  task populate_spaces_full_table: :environment do
    # Define an array of test space data
    test_space_1 = { spaces_name: 'Conference Room 03', floor_id: 2, max_occupancy: 5, description: 'Testing room' }
    test_space_2 = { spaces_name: 'Conference Room 04', floor_id: 2, max_occupancy: 9,
                     description: 'Testing room nine' }
    test_space_3 = { spaces_name: 'Conference Room 05', floor_id: 1, max_occupancy: 15,
                     description: 'Testing room diff floor' }
    Space.create(test_space_3)
    Space.create(test_space_2)
    Space.create(test_space_1)
    puts 'Test space loaded successfully!'
  end
end
