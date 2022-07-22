class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
      t.timestamps
    end
    add_index :countries, :code
    add_index :countries, :name
  end
end
