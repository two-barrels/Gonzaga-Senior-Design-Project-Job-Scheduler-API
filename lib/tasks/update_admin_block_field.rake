# frozen_string_literal: true

namespace :db do
  desc 'Update text field for older instances'
  task update_admin_block_field: :environment do
    Reservation.all.each do |reservation|
      reservation.update!(admin_block: false)
    end

    puts 'Admin block fields updated successfully!'
  end
end
