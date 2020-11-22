class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email
  has_many :favorites
  has_many :articles, through: :favorites
end
