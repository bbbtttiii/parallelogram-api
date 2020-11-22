class AddFavoriteCountToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :favorite_count, :integer
  end
end
