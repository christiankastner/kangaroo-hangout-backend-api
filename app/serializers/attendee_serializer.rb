class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :event
  belongs_to :event
end
