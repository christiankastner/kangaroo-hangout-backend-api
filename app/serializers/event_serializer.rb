class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :activities
  has_many :activities
end
