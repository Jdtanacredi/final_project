require 'clockwork'
require './config/boot'
require './config/environment'

include Clockwork

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end
  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end
  every(1.hour, 'price_check', tz: EST) do
    products = Product.all
    products.each do |product|
      price = product.calculate_price
      product.update_attribute(:price, price)
    end
  end

  every(1.day, 'time_to_charge', tz: EST) do
    products = Product.expired_and_active
    products.each do |product|
      price = product.calculate_final_price
      product.update_attribute(:price, price)
      product.orders.each do |order|
        order.charge(price)
        product.update_attribute(:active, false)
      end
    end
  end

end