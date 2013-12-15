class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :not_ref_by_line_item

  def hide_product
    @time_to_hide = product.created_at + 2.days
    #while product.created_at < @time_to_hide
    #
    #end

    if Time.now < @time_to_hide
      # KEEP SHOWING PRODUCT
    else
      #DON'T SHOW PRODUCT
    end
  end


  private

  def not_ref_by_line_item
    if line_items.empty?
       true
    else
      errors.add(:base, 'Line Items present')
      false
    end
  end
end
