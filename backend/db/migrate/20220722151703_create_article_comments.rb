class CreateArticleComments < ActiveRecord::Migration[6.1]
  def change
    create_table :article_comments do |t|
      t.bigint :article_id, null: false
      t.bigint :user_id, null: false
      t.text :description, null: false
      t.timestamps
    end
    add_index :article_comments, :article_id
    add_index :article_comments, :user_id
  end
end
