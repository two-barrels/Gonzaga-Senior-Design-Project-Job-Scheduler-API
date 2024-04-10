class Building < ApplicationRecord
    has_many :floors, optional: true
end
