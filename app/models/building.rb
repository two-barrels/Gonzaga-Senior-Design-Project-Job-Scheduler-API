class Building < ApplicationRecord
    has_many :floors
    has_many :reservations
end
