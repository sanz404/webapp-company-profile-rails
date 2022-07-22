class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.bigint :user_id, null: false
      t.string :subject, null: false
      t.string :sort_content, null: false
      t.text :full_content, null: false
      t.datetime :readed_at, null: true
      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, :subject
    add_index :notifications, :sort_content
    add_index :notifications, :readed_at
  end
end
