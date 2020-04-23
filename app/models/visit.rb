class Visit < ApplicationRecord
    belongs_to :buyer, :class_name => 'User'
    belongs_to :like
    belongs_to :listing
end
