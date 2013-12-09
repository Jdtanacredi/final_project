# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create title: 'Sweater - Test Product', description: 'This sweater is a test product', image_url: "test1.jpg", price: 80.00
Product.create title: 'Blazer - Test Product', description: 'This blazer is a test product. Please delete before going live.', image_url: "test2.jpg", price: 150.00
Product.create title: 'Blue Blazer - Test Product', description: 'This blue blazer is a test product. Please delete before going live.', image_url: "test3.jpg", price: 180.00