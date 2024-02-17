# frozen_string_literal: true

namespace :db do
  desc 'Load test space into the database'
  task populate_spaces_table: :environment do
    # Define an array of test space data
    space_one = { spaces_name: 'Conference Room 01', floor_id: 2, max_occupancy: 10,
                  description: 'a small conference room' }
    Space.create(space_one)

    # Create corresponding SpaceGeometry records
    space_one_record = Space.find_by(spaces_name: 'Conference Room 01')

    # Define square shapes for each space
    square_side_length = 10 # Define the side length of the square

    # Calculate coordinates for the squares (assuming squares are centered at origin)
    square_one_coords = "(0 0, 0 #{square_side_length}, #{square_side_length} #{square_side_length}, #{square_side_length} 0, 0 0)"

    # Create PostGIS data with squares
    SpaceGeometry.create(space_id: space_one_record.id, shape1: "POLYGON((#{square_one_coords}))")

    puts 'Test space loaded successfully!'
  end
end
