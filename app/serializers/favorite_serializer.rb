class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :article_id, :user_id
  belongs_to :users, serializer: UserSerializer
  belongs_to :articles, serializer: ArticleSerializer
end