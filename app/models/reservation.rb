# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :space
end
