class ActivitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :photo, :location, :type, :icon
  belongs_to :event
end
