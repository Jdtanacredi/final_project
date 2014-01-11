class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku
  validates_presence_of :sku

  def charge(price)
      Stripe::Charge.create(
          :amount   => (price * 100).floor,
          :currency => "usd",
          :customer => order.customer_id
      )
    end
end
