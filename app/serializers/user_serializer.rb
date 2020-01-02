class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :events, :attendees
  has_many :events, include_nested_associations: true
  has_many :attendees, include_nested_associations: true
end
