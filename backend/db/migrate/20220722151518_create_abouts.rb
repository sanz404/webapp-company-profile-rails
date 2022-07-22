class CreateAbouts < ActiveRecord::Migration[6.1]
  def change
    create_table :abouts do |t|
      t.string :image, null: true
      t.string :title, null: false
      t.text :description, null: true
      t.boolean :is_published, default: false
      t.timestamps
    end
    add_index :abouts, :image
    add_index :abouts, :title
    add_index :abouts, :is_published
  end
end
