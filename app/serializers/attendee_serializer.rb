class AttendeeSerializer
  include FastJsonapi::ObjectSerializer
  attributes 
  belongs_to :user
  belongs_to :event
end
