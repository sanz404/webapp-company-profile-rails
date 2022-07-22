class CreateFaqs < ActiveRecord::Migration[6.1]
  def change
    create_table :faqs do |t|
      t.bigint :category_id, null: false
      t.string :question, null: false
      t.longtext :answer, null: false
      t.integer :sort, default: 0
      t.boolean :is_published, default: false
      t.timestamps
    end
    add_index :faqs, :category_id
    add_index :faqs, :question
    add_index :faqs, :sort
    add_index :faqs, :is_published
  end
end
