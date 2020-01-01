class ActivitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :photo, :location, :type, :icon, :event
  belongs_to :event
end
