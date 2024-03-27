# frozen_string_literal: true

class Floor < ApplicationRecord
    belongs_to :building
    has_many :spaces
end
