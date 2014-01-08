class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku
  validates_presence_of :sku
  #has_one :product, through: :sku


  def charge(price)
    ### READ NOTES
      Stripe::Charge.create(
          :amount   => price, # or whatever the amount will be, discounted or not
          :currency => "usd",
          :customer => order.customer_id
      # Done without a current_user, loop over all the users who bought the product
      )
    end


  # def charge(price) #=> a call to stripe api
  # and price comes from what we found out in the product

end
