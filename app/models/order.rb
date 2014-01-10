class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku
  validates_presence_of :sku

  def charge(price)
      Stripe::Charge.create(
          :amount   => price,
          :currency => "usd",
          :customer => order.customer_id
      )
    end
end
