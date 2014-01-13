# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Product.create title: 'Sweater - Test Product', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', image_url: "test1.jpg", price: 80.00, expired_at: "2014-01-13 23:26:29", active: true
#Product.create title: 'Brown Blazer - Test Product', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', image_url: "test2.jpg", price: 150.00, expired_at: "2014-01-13 23:26:29", active: true
#Product.create title: 'Blue Blazer - Test Product', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', image_url: "test3.jpg", price: 180.00, expired_at: "2014-01-13 23:26:29", active: true

#
Sku.create sku_number: '1', size: 'xs', color: 'test', product_id: '4'
Sku.create sku_number: '2', size: 's', color: 'test', product_id: '4'
Sku.create sku_number: '3', size: 'm', color: 'test', product_id: '4'
Sku.create sku_number: '4', size: 'l', color: 'test', product_id: '4'
#
Sku.create sku_number: '5', size: 'xs', color: 'test', product_id: '5'
Sku.create sku_number: '6', size: 's', color: 'test', product_id: '5'
Sku.create sku_number: '7', size: 'm', color: 'test', product_id: '5'
Sku.create sku_number: '8', size: 'l', color: 'test', product_id: '5'
#
Sku.create sku_number: '9', size: 'xs', color: 'test', product_id: '6'
Sku.create sku_number: '10', size: 's', color: 'test', product_id: '6'
Sku.create sku_number: '11', size: 'm', color: 'test', product_id: '6'
Sku.create sku_number: '12', size: 'l', color: 'test', product_id: '6'