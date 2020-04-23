class City < ApplicationRecord
    has_many :towns
    has_many :listings, through: :towns
end
