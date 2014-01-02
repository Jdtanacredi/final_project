class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :sku_id
      t.integer :user_id
      t.integer :quantity
      t.string :customer_id

      t.timestamps
    end
  end
end
