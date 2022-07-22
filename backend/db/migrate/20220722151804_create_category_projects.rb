class CreateCategoryProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :category_projects do |t|
      t.string :name, null: false
      t.text :description, null: true
      t.timestamps
    end
    add_index :category_projects, :name
  end
end
