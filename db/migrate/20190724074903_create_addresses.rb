class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
