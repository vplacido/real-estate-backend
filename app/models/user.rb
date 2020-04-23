class User < ApplicationRecord
    has_many :listings, :foreign_key => 'realtor_id'
    has_many :likes, through: :listings 
    has_many :reviews, :foreign_key => 'buyer_id'
    has_many :visits, :foreign_key => 'buyer_id', :class_name => 'Like'
    # has_many :saved_listings, :foreign_key => 'buyer_id'
end
