# frozen_string_literal: true

class SpaceGeometry < ApplicationRecord
  belongs_to :space, optional: true

  attribute :shape, :geometry
end
