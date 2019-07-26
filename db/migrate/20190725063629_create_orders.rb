class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :total_price, null: false
      t.integer :payment, null: false
      t.integer :status, null: false, default: 0
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :delivery_cost, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
