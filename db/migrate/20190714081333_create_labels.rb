class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
