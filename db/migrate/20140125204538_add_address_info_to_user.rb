class AddAddressInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :zip, :integer
    add_column :users, :state, :string
    add_column :users, :country, :string
  end
end
