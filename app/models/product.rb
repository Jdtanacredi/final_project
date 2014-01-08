class Product < ActiveRecord::Base
has_many :skus
has_many :orders, through: :skus
  #before_destroy :not_ref_by_line_item

  def self.expired_and_active
    a = []
    self.where expired_at < time.now
        a.fill self
  end

  def expired?
    hide_product = self.created_at + 30.days
    Time.now > hide_product
  end

  def calculate_final_price
    
  end

  #1. class method (Product.method) to find all expired and active products ##LOOK UP SCOPES
  #2. with that array of products, loop over the array
  #3. for each product in the array, execute product.orders.count and compare to product.threshold (evaluate_discount)
  #4. given the result of evaluate_discount, price = result
  #5. loop over product.orders, inside the loop run order.charge(price)

  # def self.active_expired #=> returns expired and active products
  # def final_price #=> returns price based on orders.count vs threshold(s)
  # price = final_price()
  # then shift over to order model
  # after running order.charge on all of the product's orders, def make_inactive #=> active = false






end
