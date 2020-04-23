class Town < ApplicationRecord
    has_many :listings
    belongs_to :city
end
