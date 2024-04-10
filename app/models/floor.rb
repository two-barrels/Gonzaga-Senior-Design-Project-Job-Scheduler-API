# frozen_string_literal: true

class Floor < ApplicationRecord
  belongs_to :building, :dependent => :destroy
  has_many :spaces
end
