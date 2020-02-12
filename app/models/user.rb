class User < ApplicationRecord
    has_secure_password
    has_many :events, dependent: :destroy
    has_many :activities, through: :events
    has_many :attendees
    # validates :email, uniqueness: true
end
