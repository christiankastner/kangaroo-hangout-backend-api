class Event < ApplicationRecord
    has_many :activities
    has_many :attendees
    belongs_to :user
end
