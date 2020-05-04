class Listing < ApplicationRecord
    # belongs_to :realtor, :class_name => 'User'
    # belongs_to :town
    # has_many :likes
    # has_many :reviews, through: :likes
    # has_many :buyers, through: :likes

    has_many_attached :photos
    has_many_attached :thumbnails
    has_many :reviews, foreign_key: :listing_id, class_name: 'Review'
    belongs_to :realtor, foreign_key: :realtor_id, class_name: 'User'
    has_many :reviewers, through: :reviews, source: :user
    has_many :bookings, foreign_key: :listing_id, class_name: 'Booking'

    def self.in_bounds(bounds)
        bounds = JSON.parse(bounds)

        self.where('lat < ?', bounds["northEast"]["lat"].to_f)
        .where('lat >?', bounds["southWest"]["lat"].to_f)
        .where('long < ?', bounds["northEast"]["lng"].to_f)
        .where('long > ?', bounds["southWest"]["lng"].to_f)
    end

    def average_rating
        rating_total = 0
        count = 0

        if self.reviews
        self.reviews.each do |review|
            rating_total += review.rating
            count += 1
        end
        end

        '%.2f' % (rating_total.to_f / count).round(2)
    end

    def num_reviews
        self.reviews.count.to_s
    end
end
