class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :key_name
      t.longtext :key_value
      t.timestamps
    end
    add_index :contents, :key_name
  end
end
