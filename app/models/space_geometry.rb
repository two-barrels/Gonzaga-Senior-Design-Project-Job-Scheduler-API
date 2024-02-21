# frozen_string_literal: true

class SpaceGeometry < ApplicationRecord
  belongs_to :space

  attribute :shape, :geometry
end
