class User < ApplicationRecord
    # has_many :listings, :foreign_key => 'realtor_id'
    # has_many :likes, through: :listings 
    # has_many :reviews, :foreign_key => 'buyer_id'
    # has_many :visits, :foreign_key => 'buyer_id', :class_name => 'Like'
    # # has_many :saved_listings, :foreign_key => 'buyer_id'
    # # has_secure_password


    validates :username, :session_token, uniqueness: true
    validates :username, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    has_one_attached :photo
    has_many :reviews,
        foreign_key: :buyer_id,
        class_name: 'Review'
    has_many :bookings,
        foreign_key: :buyer_id,
        class_name: 'Booking'

    attr_reader :password
    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        return nil unless @user
        @user.is_password?(password) ? @user : nil
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
    end
end

