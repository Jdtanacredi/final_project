class DiscountsWorker
  include Sidekiq::Worker

  def perform
    products = Product.expired_and_active #self
    products.each do |product|
      price = product.calculate_final_price #inside calculate final price do product.orders.count compare to thresholds
      product.orders.each do |order|
        order.charge(price)
      end
    end
  end

end