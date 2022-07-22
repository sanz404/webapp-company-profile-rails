class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.bigint :category_id, null: false
      t.string :name, null: false
      t.string :image, null: true
      t.decimal :price, default: 0, precision: 18, scale: 4
      t.text :description, null: true
      t.boolean :is_published, default: false
      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :name
    add_index :products, :image
    add_index :products, :price
    add_index :products, :is_published
  end
end
