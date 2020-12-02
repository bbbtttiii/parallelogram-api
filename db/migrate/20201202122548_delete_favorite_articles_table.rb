class DeleteFavoriteArticlesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :favorite_articles
  end
end
