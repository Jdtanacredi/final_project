class AddExpiredAtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :expired_at, :datetime
  end
end
