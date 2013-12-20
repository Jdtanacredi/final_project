class Cart < ActiveRecord::Base
  def total_price_for_cart
    #line_items.to_a.sum { |item| item.total_price_of_product}
  end
end
