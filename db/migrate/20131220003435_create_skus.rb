class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.integer :sku_number
      t.string :size
      t.string :color
      t.integer :product_id

      t.timestamps
    end
  end
end
