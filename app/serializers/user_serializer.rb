class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :events, :activities
  has_many :events
end
