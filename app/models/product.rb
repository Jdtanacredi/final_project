class Product < ActiveRecord::Base
  #has_many :line_items

  #before_destroy :not_ref_by_line_item

  def expired?
    hide_product = self.created_at + 30.days
    Time.now > hide_product

    #while product.created_at < @hide_product
    #
    #end
    #---------------------------------------------------------------------------------------------------
    #if Time.now < @hide_product
      # KEEP SHOWING PRODUCT
    #else
      #DON'T SHOW PRODUCT
    #end
  end

  #COUNTS NUMBER OF SPECIFIC ITEMS PURCHASED. REDUCES PRICE IF PARAM MET
  def discount?
    @forty = product.price - (product.price * 0.40)
    @thirty = product.price - (product.price * 0.30)
    @twenty = product.price - (product.price * 0.20)

    #FIGURE OUT!
    line_item = self.find(params[:id])
    if line_item.count > 30
      product.price = @forty
    else
      line_item.count < 10
      product.price
    end
  end

end
