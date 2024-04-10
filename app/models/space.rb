# frozen_string_literal: true

class Space < ApplicationRecord
  has_one :space_geometry, :dependent => :destroy
  has_many :reservations
  belongs_to :floor
end
