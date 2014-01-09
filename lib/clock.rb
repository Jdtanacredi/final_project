require 'clockwork'
require './config/boot'
require './config/environment'
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end
  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  #every(10.seconds, 'frequent.job')
  #every(3.minutes, 'less.frequent.job')
  #every(1.hour, 'hourly.job')

  #every(1.hour, 'price_check') do CODE BELOW
  #be aware of timezone tz: EST
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