# frozen_string_literal: true

namespace :db do
    desc 'Load roles into the database'
    task populate_roles_table: :environment do

      # Define roles 
      admin_role = { name: 'Admin' }
      standard_role = { name: 'Standard' }
      Role.create(admin_role)
      Role.create(standard_role)
      puts 'Roles loaded successfully!'
    end
  end
  