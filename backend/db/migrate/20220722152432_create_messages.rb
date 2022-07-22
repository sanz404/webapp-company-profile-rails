class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :message, null: false
      t.timestamps
    end
    add_index :messages, :full_name
    add_index :messages, :email
    add_index :messages, :phone
  end
end
