class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = product.price * 100

    customer = Stripe::Customer.create(
        :email => 'example@stripe.com',
        :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
    )
    current_user.update_attribute(:customer_id, customer.id)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  def charge
    Stripe::Charge.create(
        :amount   => @amount, # or whatever the amount will be, discounted or not
        :currency => "usd",
        :customer => current_user.customer_id
    # or if this is done without a current_user, you could loop over all the users who bought the product
    )
  end

end
