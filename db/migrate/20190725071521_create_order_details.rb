class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :cd_amount, null: false
      t.integer :cd_price, null: false
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
