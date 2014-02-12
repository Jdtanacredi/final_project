class Product < ActiveRecord::Base
  has_many :skus
  has_many :orders, through: :skus
  scope :active, -> { where(active: true) }
  validates_presence_of :price, :title, :description, :image_url

  def self.expired_and_active
    where('expired_at < ?', Time.now).active
  end

  def calculate_final_price
      nada = price
      forty = price - (price * 0.40)
      twenty = price - (price * 0.20)

      if orders.count < 10
        amount = nada
      elsif orders.count.between?(10, 30)
        amount = twenty
        orders.update_attribute(:counted, true)
      else
        amount = forty
        orders.update_attribute(:counted, true)
      end
    end

end
