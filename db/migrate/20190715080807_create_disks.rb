class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
