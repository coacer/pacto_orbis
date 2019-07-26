class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.boolean :status, default: true, null: false
      t.string :jacket_image_id
      t.integer :stock, null: false
      t.references :artist, foreign_key: true, null: false
      t.references :label, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false

      t.timestamps
    end
  end
end
