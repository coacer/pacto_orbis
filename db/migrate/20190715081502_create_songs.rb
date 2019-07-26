class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title, null: false
      t.references :disk, foreign_key: true

      t.timestamps
    end
  end
end
