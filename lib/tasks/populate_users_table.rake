# frozen_string_literal: true

namespace :db do
  desc 'Load test users into the database'
  task populate_users_table: :environment do
    # Define an array of test user data
    test_user = { password: 'password1', email: 'fake@gmail.com' }

    User.create(test_user)

    puts 'Test user loaded successfully!'
  end
end
