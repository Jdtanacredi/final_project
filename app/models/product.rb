class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :not_ref_by_line_item

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
