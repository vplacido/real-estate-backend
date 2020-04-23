class Like < ApplicationRecord
    belongs_to :listing
    belongs_to :buyer, :class_name => 'User'
    has_many :reviews
    # reservations = likes
end
