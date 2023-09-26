# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    3.1.2

* System dependencies
    You will need to have setup a postgres server using initdb in a database file.

* Configuration
    run `bundle install` and boot api with `rails s`
    run `pg_ctl -D /home/drange/Desktop/SeniorProject/database start` to start your database.

* Database creation
    run the psql command with the -U flag as whatever user owns your initialized database and the -d flag with the name of the database then run CREATE DATABASE job_scheduler.
    Change the database.yml files username and password to use the username and password of your server.

* Database initialization

    run `rails db:migrate`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
