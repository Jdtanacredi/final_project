class ChargesController < ApplicationController

  def create
    product = Product.find params[:product_id]
    customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :card  => params[:stripeToken]
    )

    order = Order.create(
         user_id: current_user.id,
         sku_id: product.skus.find_by(size: params[:size]).id,
         quantity: '1',
         customer_id: customer.id

    )
binding.pry
    #current_user.update_attribute(:customer_id, customer.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
