class AddCountedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :counted, :boolean, :default => false
  end
end
