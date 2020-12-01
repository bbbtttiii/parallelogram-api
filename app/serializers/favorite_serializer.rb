class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :article_id, :user_id
  belongs_to :user, serializer: UserSerializer
  belongs_to :article, serializer: ArticleSerializer
end