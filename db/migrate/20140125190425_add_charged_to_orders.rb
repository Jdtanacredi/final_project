class AddChargedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :charged, :boolean, :default => false
  end
end
