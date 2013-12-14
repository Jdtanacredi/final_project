class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price_of_product
    product.price * quantity
  end

end
