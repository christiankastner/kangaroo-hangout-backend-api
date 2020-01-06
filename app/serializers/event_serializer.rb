class EventSerializer < ActiveModel::Serializer
  attributes :id, :date, :activities, :attendees
  has_many :activities
  has_many :attendees
  belongs_to :user
end
