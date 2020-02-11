class User < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :activities, through: :events
    has_many :attendees
    has_secure_password
end
