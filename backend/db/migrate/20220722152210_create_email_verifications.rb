class CreateEmailVerifications < ActiveRecord::Migration[6.1]
  def change
    create_table :email_verifications do |t|
      t.bigint :user_id, null: false
      t.string :code, null: false
      t.string :token, null: false
      t.boolean :email_confirmed, default: false
      t.boolean  :is_expired, default: false
      t.datetime :expired_at, null: true
      t.timestamps
    end
    add_index :email_verifications, :user_id
    add_index :email_verifications, :code
    add_index :email_verifications, :token
    add_index :email_verifications, :email_confirmed
    add_index :email_verifications, :is_expired
    add_index :email_verifications, :expired_at
  end
end
