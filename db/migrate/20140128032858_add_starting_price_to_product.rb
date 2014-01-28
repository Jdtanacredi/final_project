class AddStartingPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :starting_price, :decimal
  end
end
