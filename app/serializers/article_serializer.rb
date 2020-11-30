class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :tag, :author, :summary, :image_url, :id, :favorite_count
  has_many :favorites
  has_many :users, through: :favorites, serializer: UserSerializer
end