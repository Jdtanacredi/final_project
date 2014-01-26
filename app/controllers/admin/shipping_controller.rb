class Admin::ShippingController < ApplicationController
  def index
    @orders = Order.all.where(:charged => true)
  end
end
