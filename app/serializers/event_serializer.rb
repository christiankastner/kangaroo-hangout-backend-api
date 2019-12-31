class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date
  has_many :activities
end
