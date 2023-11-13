namespace :db do
  desc 'Load test space into the database'
  task populate_spaces_table: :environment do
    # Define an array of test space data
<<<<<<< HEAD
    test_space = { spaces_name: 'Conference Room 01', floor_id: 002 }
    test_space_2 = {  spaces_name: 'Conference Room 02', floor_id: 001 }
    Space.create(test_space)
    Space.create(test_space_2)
    puts "Test space loaded successfully!"
    end
  end
=======
    test_space = { spaces_id: 0o01, spaces_name: 'Conference Room 01', floor_id: 0o02 }
    Space.create(test_space)
    puts 'Test space loaded successfully!'
  end
end
>>>>>>> epic/phase-one
