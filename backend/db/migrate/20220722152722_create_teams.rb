class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :image, null: true
      t.string :name, null: false
      t.string :position, null: true
      t.text :description, null: true
      t.boolean :is_published, default: false
      t.timestamps
    end
    add_index :teams, :image
    add_index :teams, :name
    add_index :teams, :position
    add_index :teams, :is_published
  end
end
