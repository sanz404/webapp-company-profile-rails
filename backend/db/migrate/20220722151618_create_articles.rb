class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.bigint :user_id, null: false
      t.string :image, null: true
      t.string :slug, null: false
      t.string :title, null: false
      t.longtext :content, null: false
      t.boolean :is_published, default: false
      t.timestamps
    end
    add_index :articles, :user_id
    add_index :articles, :image
    add_index :articles, :slug
    add_index :articles, :title
    add_index :articles, :is_published
  end
end
