namespace :db do
  desc "Load test users into the database"
  task populate_account_table: :environment do
    # Define an array of test user data
    test_user = { name: 'User1', password: 'password1', email: "fake@gmail.com" }

    Account.create(test_user)

    puts "Test user loaded successfully!"
  end
end
