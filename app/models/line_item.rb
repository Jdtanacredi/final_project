class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price_of_product
    product.price * quantity
  end


#COUNTS NUMBER OF SPECIFIC ITEMS PURCHASED. REDUCES PRICE IF PARAM MET
  def total_spec_products_purchased
    @forty = product.price - (product.price * 0.40)
    @thirty = product.price - (product.price * 0.30)
    @twenty = product.price - (product.price * 0.20)


    #FIGURE OUT!
    line_item = LineItem.find(params[:id])
      if line_item.count > 30
        product.price = @forty
      elsif
        line_item.count < 10
        product.price
      end
  end


end
