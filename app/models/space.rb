# frozen_string_literal: true

class Space < ApplicationRecord
  has_one :space_geometry
  has_many :reservations
end
