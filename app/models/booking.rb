class Booking < ApplicationRecord
    belongs_to :listing, foreign_key: :listing_id, class_name: 'Listing'
  
  belongs_to :user, foreign_key: :buyer_id, class_name: 'User'

end
