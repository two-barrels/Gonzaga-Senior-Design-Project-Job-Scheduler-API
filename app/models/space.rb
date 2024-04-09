# frozen_string_literal: true

class Space < ApplicationRecord
  has_one :space_geometry, :dependent => :destroy
  belongs_to :floor
end
