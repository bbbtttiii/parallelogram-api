class ChangeJoinTableDatatypes < ActiveRecord::Migration[6.0]
  def change
    change_column :favorites, :user_id, :integer, using: 'user_id::integer'
    change_column :favorites, :article_id, :integer, using: 'article_id::integer'
  end
end
