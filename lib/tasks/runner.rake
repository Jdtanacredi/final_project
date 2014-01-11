  desc 'price check'
  task :calculate_price => :environment do
    products = Product.all
    products.each do |product|
      price = product.calculate_final_price
      product.update_attribute(:price, price)
    end
  end

    task :check_expired => :environment do
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
