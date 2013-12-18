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


  #private
  #
  #def not_ref_by_line_item
  #  if line_items.empty?
  #     true
  #  else
  #    errors.add(:base, 'Line Items present')
  #    false
  #  end
  #end
end
