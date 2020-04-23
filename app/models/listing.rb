class Listing < ApplicationRecord
    belongs_to :realtor, :class_name => 'User'
    belongs_to :town
    has_many :likes
    has_many :reviews, through: :likes
    has_many :buyers, through: :likes
end
