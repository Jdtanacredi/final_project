class Product < ActiveRecord::Base
  has_many :skus
  has_many :orders, through: :skus
  #before_destroy :not_ref_by_line_item

  def self.expired_and_active
    where('expired_at < ?', Time.now)
  end

  def calculate_final_price
    expired_products = Product.expired_and_active
    expired_products.each do |product|
      nada = product.price
      forty = product.price - (product.price * 0.40)
      twenty = product.price - (product.price * 0.20)

      if product.orders.count < 10
        @amount = nada
      elsif product.orders.count.between(10, 30)
        @amount = twenty
      else
        @amount = forty
      end
    end
  end

  def calculate_price

    self.each do |product|
      nada = product.price
      forty = product.price - (product.price * 0.40)
      twenty = product.price - (product.price * 0.20)

      if product.orders.count < 10
        @amount = nada
      elsif product.orders.count.between(10, 30)
        @amount = twenty
      else
        @amount = forty
      end
    end
  end

  #Erase once I set active/not active
  def expired?
    hide_product = self.created_at + 30.days
    Time.now > hide_product
  end

  #1.!!! class method (Product.method) to find all expired and active products ##LOOK UP SCOPES
  #2.!!! with that array of products, loop over the array
  #3.!!! for each product in the array, execute product.orders.count and compare to product.threshold (evaluate_discount)
  #4.!!! given the result of evaluate_discount, price = result
  #5. loop over product.orders, inside the loop run order.charge(price)

  # def self.active_expired #=> returns expired and active products
  # def final_price #=> returns price based on orders.count vs threshold(s)
  # price = final_price()
  # then shift over to order model
  # after running order.charge on all of the product's orders, def make_inactive #=> active = false


end
