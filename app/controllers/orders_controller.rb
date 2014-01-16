class OrdersController < ApplicationController
  def index
    @orders = Order.all.where(:user_id => current_user.id)
  end

  def show
  end
end