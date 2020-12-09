class AddArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :summary
      t.string :tag
      t.string :image_url
      t.text :content
      t.integer :favorite_count
    end
  end
end
