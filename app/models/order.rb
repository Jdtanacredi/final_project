class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku
  validates_presence_of :sku
  #has_one :product, through: :sku

  #COUNTS NUMBER OF SPECIFIC ITEMS PURCHASED. REDUCES PRICE IF PARAM MET
  def discount?
    nada = product.price
    forty = product.price - (product.price * 0.40)
    twenty = product.price - (product.price * 0.20)
    #FIGURE OUT!
    @orders_done = find products.expired?.all
    if @orders_done.count < 10
      @amount = nada
    elsif
    @orders_done.count.between?(10, 30)
      @amount = twenty
    else
      @amount = forty
    end
  end


  #Product.where expired?
  #product1.discount?

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
