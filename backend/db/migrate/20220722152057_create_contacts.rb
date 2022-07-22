class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: true
      t.string :email, null: true
      t.string :phone, null: true
      t.string :website, null: true
      t.text :address, null: true
      t.timestamps
    end
    add_index :contacts, :name
    add_index :contacts, :email
    add_index :contacts, :phone
    add_index :contacts, :website
  end
end
