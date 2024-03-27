# frozen_string_literal: true

namespace :db do
    desc 'Update text field for older instances'
    task update_reservations_text: :environment do
        Reservation.all.each do |reservation|
            reservation.update!(text: "Booked")
        end
  
      puts 'Text fields updated successfully!'
    end
  end