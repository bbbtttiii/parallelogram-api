class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :tag, :author, :summary
  has_many :favorites
  has_many :users, through: :favorites, serializer: UserSerializer
end