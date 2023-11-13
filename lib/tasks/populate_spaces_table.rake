namespace :db do
  desc 'Load test space into the database'
  task populate_spaces_table: :environment do
    # Define an array of test space data
    test_space = { spaces_name: 'Conference Room 01', floor_id: 2 }
    Space.create(test_space)
    puts 'Test space loaded successfully!'
  end
end
