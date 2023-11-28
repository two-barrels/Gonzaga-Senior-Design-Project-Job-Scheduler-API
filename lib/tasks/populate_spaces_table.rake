# frozen_string_literal: true

namespace :db do
  desc 'Load test space into the database'
  task populate_spaces_table: :environment do
    # Define an array of test space data
    space_one = { spaces_name: 'Conference Room 01', floor_id: 2, max_occupancy: 10, description: "a small conference room"}
    space_two = { spaces_name: 'Conference Room 03', floor_id: 2, max_occupancy: 20, description: "another small conference room"}
    space_three = { spaces_name: 'Conference Room 04', floor_id: 1, max_occupancy: 8, description: "tiny conference room"}
    Space.create(space_one)
    Space.create(space_two)
    Space.create(space_three)
    puts 'Test space loaded successfully!'
  end
end
