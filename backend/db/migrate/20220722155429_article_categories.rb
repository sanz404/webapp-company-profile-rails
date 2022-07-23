class ArticleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :article_categories do |t|
      t.references :category_article, null: false, foreign_key: false
      t.references :article, null: false, foreign_key: false
      t.timestamps
    end
  end
end
