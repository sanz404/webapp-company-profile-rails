class ArticleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :artilce_categories do |t|
      t.references :category_articles, null: false, foreign_key: false
      t.references :articles, null: false, foreign_key: false
      t.timestamps
    end
  end
end
