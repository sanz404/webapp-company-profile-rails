class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.bigint :country_id, null: true
      t.string :username, limit: 191, null: false
      t.string :email, limit: 191, null: false
      t.string :phone, null: true
      t.text :address1, null: true
      t.text :address2, null: true
      t.string :city, null: true
      t.string :zip_code, null: true
      t.string :password_digest
      t.boolean :is_admin, default: true
      t.boolean :status, default: false
      t.timestamps
    end
    add_index :users, :country_id
    add_index :users, :username
    add_index :users, :email
    add_index :users, :phone
    add_index :users, :city
    add_index :users, :zip_code
    add_index :users, :is_admin
    add_index :users, :status
  end
end
