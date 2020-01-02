class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :formatted_address
  belongs_to :event
end
