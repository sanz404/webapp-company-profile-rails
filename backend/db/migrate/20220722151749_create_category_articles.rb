class CreateCategoryArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :category_articles do |t|
      t.string :name, null: false
      t.text :description, null: true
      t.timestamps
    end
    add_index :category_articles, :name
  end
end
