# README

* Ruby version
    3.1.2

* System dependencies
    You will need to have setup a postgres server using initdb in a database file.

* Configuration
    run `bundle install` and boot api with `rails s`
    run `pg_ctl -D <path to database file> start` to start your database.

* Database creation
    `docker-compose up -d`
    `rails db:create`
    `rails db:migrate`
    
    

* Database initialization

    run `rails db:migrate`

* How to run the test suite

* Deployment instructions

* NOTE
run the helpful_setup.sh file to create your env and add some command aliases
`bash helpful_setup.sh`
