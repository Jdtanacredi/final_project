class ChargesController < ApplicationController

  def create
    customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :card  => params[:stripeToken]
    )
    current_user.update_attribute(:customer_id, customer.id)

    binding.pry

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  def charge
    ### READ NOTES
    @amount = Product.find(params[:id]).price * 100

    Stripe::Charge.create(
        :amount   => @amount, # or whatever the amount will be, discounted or not
        :currency => "usd",
        :customer => current_user.customer_id
    # Done without a current_user, loop over all the users who bought the product
    )
  end
end
