class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email
  has_many :favorites, serializer: FavoritesSerializer
  has_many :articles, through: :favorites
end
