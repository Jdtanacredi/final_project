class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku
  validates_presence_of :sku, :user

  def charge(price)
      Stripe::Charge.create(
          :amount   => (price * 100).floor,
          :currency => "usd",
          :customer => customer_id
      )
  end

  def self.search_for(query)
    where('id LIKE :query OR sku_id LIKE :query OR user.title', query:  "#{query}%")
  end

end
