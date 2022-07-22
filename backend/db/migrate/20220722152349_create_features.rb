class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :icon, null: true
      t.string :title, null: false
      t.text :description, null: true
      t.boolean :is_published, default: false
      t.timestamps
    end
    add_index :features, :icon
    add_index :features, :title
    add_index :features, :is_published
  end
end
