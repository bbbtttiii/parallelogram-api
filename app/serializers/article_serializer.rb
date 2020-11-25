class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :tag, :author, :summary
end
