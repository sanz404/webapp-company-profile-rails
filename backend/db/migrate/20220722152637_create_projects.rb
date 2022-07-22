class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.bigint :category_id, null: false
      t.string :name, null: false
      t.string :image, null: true
      t.text :description, null: true
      t.boolean :is_published, default: false
      t.timestamps
    end
    add_index :projects, :category_id
    add_index :projects, :name
    add_index :projects, :image
    add_index :projects, :is_published
  end
end
