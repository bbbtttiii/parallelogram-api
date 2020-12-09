class AddFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :user_id
      t.string :article_id
    end
  end
end
