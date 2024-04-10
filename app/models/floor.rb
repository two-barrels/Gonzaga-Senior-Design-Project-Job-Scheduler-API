# frozen_string_literal: true

class Floor < ApplicationRecord
  belongs_to :building, optional: true
  has_many :spaces
end
