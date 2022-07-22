class CreateCategoryFaqs < ActiveRecord::Migration[6.1]
  def change
    create_table :category_faqs do |t|
      t.string :name, null: false
      t.text :description, null: true
      t.timestamps
    end
    add_index :category_faqs, :name
  end
end
