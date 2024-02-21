# frozen_string_literal: true

namespace :db do
  desc 'Load test space into the database'
  task populate_spaces_table: :environment do
    # Define an array of test space data
    space_one = { spaces_name: 'Conference Room 01', floor_id: 2, max_occupancy: 10,
                  description: 'a small conference room' }
    space_one = Space.create(space_one)

    top_left = [40.0, -74.0]  # latitude, longitude
    top_right = [40.0, -73.0] # latitude, longitude
    bottom_right = [39.0, -73.0] # latitude, longitude
    bottom_left = [39.0, -74.0] # latitude, longitude

    # Create a linear ring representing the square
    linear_ring_factory = RGeo::Geographic.simple_mercator_factory
    linear_ring = linear_ring_factory.linear_ring([
                                                    linear_ring_factory.point(*top_left),
                                                    linear_ring_factory.point(*top_right),
                                                    linear_ring_factory.point(*bottom_right),
                                                    linear_ring_factory.point(*bottom_left),
                                                    linear_ring_factory.point(*top_left) # Closing the ring
                                                  ])

    # Create a polygon geometry from the linear ring
    polygon_factory = RGeo::Geographic.spherical_factory(srid: 4326)
    square = polygon_factory.polygon(linear_ring)

    SpaceGeometry.create(space_id: space_one.id, shape: square)

    puts 'Test space loaded successfully!'
  end
end
